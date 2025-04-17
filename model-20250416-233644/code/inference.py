import torch
import json
import pandas as pd
import joblib
import numpy as np
from sklearn.pipeline import Pipeline

# Load artifacts at startup
def model_fn(model_dir):
    model = BPO_PlayPredictor(
        input_size=72,
        num_formations=6,
        num_types=16,
        num_choices=1
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
    raise ValueError(f"Unsupported content type: {content_type}")

def predict_fn(input_data, model):
    # Preprocess input
    processed = preprocessor.transform(input_data).toarray()
    tensor = torch.tensor(processed, dtype=torch.float32)
    
    # Get predictions
    with torch.no_grad():
        outputs = model(tensor)
    
    # Split outputs using dynamic class counts
    form_logits = outputs[:, :6]
    type_logits = outputs[:, 6:22]
    choice_logits = outputs[:, 22:]
    
    # Calculate probabilities
    form_probs = torch.softmax(form_logits, dim=1)
    type_probs = torch.softmax(type_logits, dim=1)
    choice_probs = torch.softmax(choice_logits, dim=1)
    
    # Get predictions and confidence
    form_pred = form_probs.argmax().item()
    type_pred = type_probs.argmax().item()
    choice_pred = choice_probs.argmax().item()
    
    return {
        "formation": formation_enc.inverse_transform([form_pred])[0],
        "formation_confidence": form_probs[0, form_pred].item(),
        "playtype": playtype_enc.inverse_transform([type_pred])[0],
        "playtype_confidence": type_probs[0, type_pred].item(),
        "playchoice": playchoice_enc.inverse_transform([choice_pred])[0],
        "playchoice_confidence": choice_probs[0, choice_pred].item()
    }

def output_fn(prediction, accept_type):
    if accept_type == 'application/json':
        return json.dumps(prediction), accept_type
    raise ValueError(f"Unsupported accept type: {accept_type}")
