# model evaluation testing

import torch
from torch.utils.data import DataLoader
from train import NFLDataset
import numpy as np

def evaluate_model(model, processor):
    # Access processed data from DataProcessor object
    x = processor.X  # Sparse feature matrix
    y = processor.y  # Target array
    x = np.asarray(x.toarray(), dtype=np.float32)
    dataset = NFLDataset(x, y)
    loader = DataLoader(dataset, batch_size=64)
    
    model.eval()
    correct_form = 0
    correct_type = 0
    correct_choice = 0
    total = 0
    
    with torch.no_grad():
        for features, targets in loader:
            outputs = model(features)
            
            # Split outputs and targets
            # Get dynamic class counts from processor
            num_formations = len(processor.formation_encoder.classes_)
            num_types = len(processor.playtype_encoder.classes_)
            
            formation_out = outputs[:, :num_formations]
            playtype_out = outputs[:, num_formations:num_formations + num_types]
            playchoice_out = outputs[:, num_formations + num_types:]
            
            formation_label = targets[:, 0].long()
            playtype_label = targets[:, 1].long()
            playchoice_label = targets[:, 2].long()
            
            # Calculate accuracy for each task
            _, predicted_form = torch.max(formation_out.data, 1)
            correct_form += (predicted_form == formation_label).sum().item()
            
            _, predicted_type = torch.max(playtype_out.data, 1)
            correct_type += (predicted_type == playtype_label).sum().item()
            
            _, predicted_choice = torch.max(playchoice_out.data, 1)
            correct_choice += (predicted_choice == playchoice_label).sum().item()
            
            total += targets.size(0)
    
    results = {
        'formation': correct_form / total,
        'playtype': correct_type / total,
        'playchoice': correct_choice / total
    }
    
    print(f"Formation Accuracy: {results['formation']:.4f}")
    print(f"Play Type Accuracy: {results['playtype']:.4f}")
    print(f"Play Choice Accuracy: {results['playchoice']:.4f}")
    
    return results
