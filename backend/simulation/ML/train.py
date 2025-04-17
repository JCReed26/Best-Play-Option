# Dataset + Model Training 
import torch 
from torch.utils.data import Dataset, DataLoader 
import torch.nn as nn
import torch.optim as optim 
import numpy as np
from sklearn.model_selection import train_test_split
from model import BPO_PlayPredictor

class NFLDataset(Dataset):
    # features are training numbers
    # keep separate targets for all 3 to return 
    def __init__(self, features, targets): 
        self.features = torch.tensor(features, dtype=torch.float32)
        self.targets = torch.tensor(targets, dtype=torch.long)

    def __len__(self):
        return len(self.features)
    
    def __getitem__(self, index):
        return self.features[index], self.targets[index]

def train_model(processor, epochs=10, batch_size=64):
    # Get data from DataProcessor
    x = processor.X
    y = processor.y
    x = np.asarray(x.toarray(), dtype=np.float32)  # Convert to dense float32 array
    indices = np.arange(x.shape[0])
    train_idx, test_idx = train_test_split(indices, test_size=0.2, random_state=42)
    
    x_train = x[train_idx]
    x_test = x[test_idx]
    y_train = y[train_idx]
    y_test = y[test_idx]

    print(x_train.ndim, " x_train - ", x_test.ndim, " x_test ")
    print(y_train.ndim, " y_train - ", y_test.ndim, " y_test ")

    # create sets 
    train_set = NFLDataset(x_train, y_train)
    test_set = NFLDataset(x_test, y_test)

    # create loaders 
    train_loader = DataLoader(train_set, batch_size=batch_size, shuffle=False) #can switch to true ? we can test it out
    test_loader = DataLoader(test_set, batch_size=batch_size)

    # create model
    model = BPO_PlayPredictor(
        input_size=x_train.shape[1],
        num_formations=len(processor.formation_encoder.classes_),
        num_types=len(processor.playtype_encoder.classes_),
        num_choices=len(processor.playchoice_encoder.classes_)
    )
    
    # Get dynamic class counts from model
    num_formations = model.num_formations
    num_types = model.num_types
    num_choices = model.num_choices

    # setup loss testing
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)

    # training loop 
    for epoch in range(epochs):
        model.train()
        train_loss = 0.0

        # training 
        for features, targets in train_loader:
            optimizer.zero_grad()

            outputs = model(features)
            # Split concatenated outputs and targets
            form_out = outputs[:, :num_formations]
            type_out = outputs[:, num_formations:num_formations + num_types]
            choice_out = outputs[:, num_formations + num_types:num_formations + num_types + num_choices]
            
            formation_label = targets[:, 0].long()
            playtype_label = targets[:, 1].long()
            playchoice_label = targets[:, 2].long()
            
            loss = (criterion(form_out, formation_label) +
                   criterion(type_out, playtype_label) +
                   criterion(choice_out, playchoice_label))
            loss.backward()
            optimizer.step()
            train_loss += loss.item() * features.size(0)
    
        # validation 
        model.eval()
        test_loss = 0.0
        with torch.no_grad(): 
            for features, targets in test_loader:
                outputs = model(features)
                form_out = outputs[:, :num_formations]
                type_out = outputs[:, num_formations:num_formations + num_types]
                choice_out = outputs[:, num_formations + num_types:]
                
                formation_label = targets[:, 0].long()
                playtype_label = targets[:, 1].long()
                playchoice_label = targets[:, 2].long()
                
                test_loss += (
                    criterion(form_out, formation_label) + 
                    criterion(type_out, playtype_label) + 
                    criterion(choice_out, playchoice_label)
                ).item() * features.size(0)

        # average losses 
        train_loss = train_loss / len(train_loader.dataset)
        test_loss = test_loss / len(test_loader.dataset)

        print(f'Epoch {epoch+1}/{epochs} | '
              f'Train Loss: {train_loss:.4f} | '
              f'Test Loss: {test_loss:.4f} | ')
    
    return model
