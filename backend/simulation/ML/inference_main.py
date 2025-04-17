# test_inference.py
import os
import json
import joblib
import pandas as pd
import torch
from model import BPO_PlayPredictor

def load_model_artifacts(model_dir):
    """Load encoders, preprocessor, and model."""
    formation_encoder = joblib.load(os.path.join(model_dir, 'formation_encoder.joblib'))
    playtype_encoder = joblib.load(os.path.join(model_dir, 'playtype_encoder.joblib'))
    playchoice_encoder = joblib.load(os.path.join(model_dir, 'playchoice_encoder.joblib'))
    preprocessor = joblib.load(os.path.join(model_dir, 'preprocessor.joblib'))

    # Determine input size using a sample input
    sample_input = {
        "OffenseTeam": "DET",
        "DefenseTeam": "NYG",
        "Quarter": 3,
        "YardLine": 35,
        "Down": 3, 
        "ToGo": 4,
        "Minute": 12,
        "Second": 7
    }
    sample_df = pd.DataFrame([sample_input])
    processed_sample = preprocessor.transform(sample_df).toarray()
    input_size = processed_sample.shape[1]

    # Initialize model
    model = BPO_PlayPredictor(
        input_size=input_size,
        num_formations=len(formation_encoder.classes_),
        num_types=len(playtype_encoder.classes_),
        num_choices=len(playchoice_encoder.classes_)
    )
    model.load_state_dict(torch.load(os.path.join(model_dir, 'model.pth')))
    model.eval()

    return model, preprocessor, formation_encoder, playtype_encoder, playchoice_encoder

def predict(input_data, model, preprocessor, formation_encoder, playtype_encoder, playchoice_encoder):
    """Process input and return predictions."""
    # Convert input to DataFrame and preprocess
    input_df = pd.DataFrame([input_data])
    processed_input = preprocessor.transform(input_df).toarray()
    input_tensor = torch.tensor(processed_input, dtype=torch.float32)

    # Predict
    with torch.no_grad():
        outputs = model(input_tensor)

    # Split outputs
    num_formations = model.num_formations
    num_types = model.num_types
    num_choices = model.num_choices

    form_logits = outputs[:, :num_formations]
    type_logits = outputs[:, num_formations:num_formations + num_types]
    choice_logits = outputs[:, num_formations + num_types:num_formations + num_types + num_choices]

    # Calculate probabilities
    form_probs = torch.softmax(form_logits, dim=1)
    type_probs = torch.softmax(type_logits, dim=1)
    choice_probs = torch.softmax(choice_logits, dim=1)


    def get_top_10_predictions(probs, encoder, max_k=10):
        num_classes = probs.shape[1]
        k = min(max_k, num_classes) # to handle a dynamic amount of plays 
        top_probs, top_indicies = torch.topk(probs, k=k, dim=1)
        top_probs = top_probs[0].tolist()
        top_indicies = top_indicies[0].tolist()
        labels = encoder.inverse_transform(top_indicies)
        return [{"label": label, "confidence": prob} for label, prob in zip(labels, top_probs)]

    formation_preds = get_top_10_predictions(form_probs, formation_encoder)
    playtype_preds = get_top_10_predictions(type_probs, playtype_encoder)
    choice_preds= get_top_10_predictions(choice_probs, playchoice_encoder)

    return {
        "formation_predictions": formation_preds,
        "playtype_predictions": playtype_preds,
        "choice_predictions": choice_preds
    }

''' 
    In the future we should take in actual plays
    option 1 
        we could have some way with multiple little models proccessing different pieces of
        prediction data and put all that together for a final model to output 

    option 2
        regular plays from play book go in with their play info connected. 
        put those plays as input and based off pbp data with current gametime data 
        get the prediction of all those play options - refitting each turnover 
'''

def get_predictions(input_data):
    # Path to the directory containing model artifacts
    MODEL_DIR = './model-20250416-233644'

    # Load artifacts and model
    model, preprocessor, formation_enc, playtype_enc, playchoice_enc = load_model_artifacts(MODEL_DIR)

    # Example input (correct column names and structure)
    input_json = {
        "OffenseTeam": "DET",
        "DefenseTeam": "GB",
        "Quarter": 3,
        "YardLine": 70,
        "Down": 3, 
        "ToGo": 4,
        "Minute": 12,
        "Second": 7  
    }

    # Get prediction
    prediction = predict(input_json, model, preprocessor, formation_enc, playtype_enc, playchoice_enc)
    print(json.dumps(prediction, indent=2))