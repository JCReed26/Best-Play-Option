# Pytorch Model 
# NN design file

import torch 
import torch.nn as nn

class BPO_PlayPredictor(nn.Module):
    def __init__(self, input_size, num_formations, num_types, num_choices):
        super().__init__()
        self.shared = nn.Sequential(
            nn.Linear(input_size, 128),
            nn.BatchNorm1d(128),
            nn.ReLU(),
            nn.Linear(128, 64),
            nn.ReLU()
        )
        self.form_head = nn.Linear(64, num_formations)
        self.play_head = nn.Linear(64, num_types)
        self.choice_head = nn.Linear(64, num_choices)
        self.num_formations = num_formations
        self.num_types = num_types
        self.num_choices = num_choices

    def forward(self, x):
        x = self.shared(x)
        return torch.cat((
            self.form_head(x), 
            self.play_head(x),
            self.choice_head(x)
        ), dim=1)
    
    def predict(self, x):
        with torch.no_grad():
            outputs = self.forward(x)
            formation = torch.argmax(outputs[:, :self.num_formations], dim=1)
            playtype = torch.argmax(outputs[:, self.num_formations:self.num_formations + self.num_types], dim=1)
            playchoice = torch.argmax(outputs[:, self.num_formations + self.num_types:], dim=1)
            return formation, playtype, playchoice
