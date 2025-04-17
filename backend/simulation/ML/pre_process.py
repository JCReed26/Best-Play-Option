# Data Preprocessor 
# Sets data up to be trained through the model properly

import os
import joblib
import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler, LabelEncoder, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline

class DataProcessor:
    def __init__(self):
        self.X = None
        self.y = None
        self.scaler = StandardScaler()
        self.team_encoder = OneHotEncoder(handle_unknown='ignore')
        self.formation_encoder = LabelEncoder()
        self.playtype_encoder = LabelEncoder()
        self.playchoice_encoder = LabelEncoder()
        self.preprocessor = None

    def preprocess(self, df):
        # Store processed data as attributes
        self.df = df
        numeric_play_data = ['Down', 'ToGo', 'YardLine', 'Quarter', 'Minute', 'Second']
        team_data = ['OffenseTeam', 'DefenseTeam']

        # handle missing information - IGNORE-TIL-LATER --- use as a point to skew later new model freshly trained each time???
        df['Formation'] = df['Formation'].fillna('SHOTGUN') # Most Common Play Formation
        df['PlayType'] = df['PlayType'].fillna('PASS') # Most Common Play Type 

        # combine passrush
        df['PlayChoice'] = (df['PassType'] + ' ' + df['RushDirection']).str.strip()
        df['PlayChoice'] = df['PlayChoice'].fillna(-999) # we have UNKNOWN but as a test -999 immutable

        # encode targets form play and choice
        y_form = self.formation_encoder.fit_transform(df['Formation'])
        y_play = self.playtype_encoder.fit_transform(df['PlayType'])
        y_choice = self.playchoice_encoder.fit_transform(df['PlayChoice'])

        # pipe it  
        num_transformer = Pipeline(steps=[('scaler', StandardScaler())])
        team_transformer = Pipeline(steps=[('onehot', OneHotEncoder(handle_unknown='ignore'))])

        self.preprocessor = ColumnTransformer(
            transformers=[
                ('num', num_transformer, numeric_play_data),
                ('team', team_transformer, team_data)
            ]
        )
        x = self.preprocessor.fit_transform(df)
        # Stack targets into 2D array [samples, targets] - if not its 0D not possible to map
        y_targets = np.column_stack((y_form, y_play, y_choice))
        self.X = x  # Store features matrix
        self.y = y_targets  # Store targets array
        return self

    def save_objects(self, path): 
        os.makedirs(path, exist_ok=True)
        joblib.dump(self.formation_encoder, os.path.join(path, 'formation_encoder.joblib'))
        joblib.dump(self.playtype_encoder, os.path.join(path, 'playtype_encoder.joblib'))
        joblib.dump(self.playchoice_encoder, os.path.join(path, 'playchoice_encoder.joblib'))
        joblib.dump(self.preprocessor, os.path.join(path, 'preprocessor.joblib'))
