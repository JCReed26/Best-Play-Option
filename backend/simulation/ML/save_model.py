import os
import torch
import tarfile
import pandas as pd
from datetime import datetime    


def save_model(model, processor):
    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    dir_name = f"model-{timestamp}"
    os.makedirs(dir_name, exist_ok=True)
    os.makedirs(os.path.join(dir_name, 'code'), exist_ok=True)

    try:
        # 1. Save model weights
        model_path = os.path.join(dir_name, 'model.pth')
        torch.save(model.state_dict(), model_path)

        # 2. Save preprocessing artifacts
        processor.save_objects(dir_name)

        # 3. Create SageMaker-compatible inference script
        num_formations = len(processor.formation_encoder.classes_)
        num_types = len(processor.playtype_encoder.classes_)
        num_choices = len(processor.playchoice_encoder.classes_)

        # Create dummy data with valid values for scaling
        sample_df = pd.DataFrame([{
            "OffenseTeam": "DET",
            "DefenseTeam": "GB",
            "Down": 1,
            "ToGo": 10,
            "YardLine": 50,
            "Quarter": 1,
            "Minute": 15,
            "Second": 0
        }])

        # Get transformed input size
        processed_sample = processor.preprocessor.transform(sample_df)
        input_size = processed_sample.shape[1]

        with open(os.path.join(dir_name, 'code', 'inference.py'), 'w') as f:
            f.write(f"""import torch
import json
import pandas as pd
import joblib
import numpy as np
from sklearn.pipeline import Pipeline

# Load artifacts at startup
def model_fn(model_dir):
    model = BPO_PlayPredictor(
        input_size={input_size},
        num_formations={num_formations},
        num_types={num_types},
        num_choices={num_choices}
    )
    model.load_state_dict(torch.load(os.path.join(model_dir, 'model.pth')))
    model.eval()
    
    global preprocessor, formation_enc, playtype_enc, playchoice_enc
    preprocessor = joblib.load(os.path.join(model_dir, 'preprocessor.joblib'))
    formation_enc = joblib.load(os.path.join(model_dir, 'formation_encoder.joblib'))
    playtype_enc = joblib.load(os.path.join(model_dir, 'playtype_encoder.joblib'))
    playchoice_enc = joblib.load(os.path.join(model_dir, 'playchoice_encoder.joblib'))
    
    return model

def input_fn(input_data, content_type):
    if content_type == 'application/json':
        data = json.loads(input_data)
        return pd.DataFrame([data])
    raise ValueError(f"Unsupported content type: {{content_type}}")

def predict_fn(input_data, model):
    # Preprocess input
    processed = preprocessor.transform(input_data).toarray()
    tensor = torch.tensor(processed, dtype=torch.float32)
    
    # Get predictions
    with torch.no_grad():
        outputs = model(tensor)
    
    # Split outputs using dynamic class counts
    form_logits = outputs[:, :{num_formations}]
    type_logits = outputs[:, {num_formations}:{num_formations+num_types}]
    choice_logits = outputs[:, {num_formations+num_types}:]
    
    # Calculate probabilities
    form_probs = torch.softmax(form_logits, dim=1)
    type_probs = torch.softmax(type_logits, dim=1)
    choice_probs = torch.softmax(choice_logits, dim=1)
    
    # Get predictions and confidence
    form_pred = form_probs.argmax().item()
    type_pred = type_probs.argmax().item()
    choice_pred = choice_probs.argmax().item()
    
    return {{
        "formation": formation_enc.inverse_transform([form_pred])[0],
        "formation_confidence": form_probs[0, form_pred].item(),
        "playtype": playtype_enc.inverse_transform([type_pred])[0],
        "playtype_confidence": type_probs[0, type_pred].item(),
        "playchoice": playchoice_enc.inverse_transform([choice_pred])[0],
        "playchoice_confidence": choice_probs[0, choice_pred].item()
    }}

def output_fn(prediction, accept_type):
    if accept_type == 'application/json':
        return json.dumps(prediction), accept_type
    raise ValueError(f"Unsupported accept type: {{accept_type}}")
""")

        # 4. Update requirements.txt
        with open(os.path.join(dir_name, 'code', 'requirements.txt'), 'w') as f:
            f.write("torch==2.6.0\npandas\nscikit-learn\njoblib\nnumpy")

        # 5. Create tar archive
        tar_name = f"{dir_name}.tar.gz"
        with tarfile.open(tar_name, "w:gz") as tar:
            tar.add(dir_name, arcname=os.path.basename(dir_name))
    finally: 
        pass