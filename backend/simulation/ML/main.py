import pandas as pd
from pre_process import DataProcessor
from train import train_model
from eval import evaluate_model
from model import BPO_PlayPredictor
from sage_conn import save_model_to_s3
from save_model import save_model

if __name__ == "__main__":
    # load datasets 
    dfs = [
        pd.read_csv('backend\simulation\ML\data\pbp-2022.csv'),
        pd.read_csv('backend\simulation\ML\data\pbp-2023.csv'), 
        pd.read_csv('backend\simulation\ML\data\pbp-2024.csv')
    ]
    df = pd.concat(dfs, ignore_index=True)
    
    print("Year distribution in play-by-play data:")
    print(df['SeasonYear'].value_counts())

    print(len(df['Formation'].unique()))
    print(len(df['PlayType'].unique()))    
    print(len(df['PassType'].unique()) + len(df['RushDirection'].unique()))
    
    print("most common formation " + df['Formation'].mode()[0])
    print("most common playtype " + df['PlayType'].mode()[0])
    print("most common passtype " + df['PassType'].mode()[0])
    print("most common rushdirection " + df['RushDirection'].mode()[0])

    print(df['Formation'].unique().tolist())
    print(df['PlayType'].unique().tolist())
    print(df['PassType'].unique().tolist())
    print(df['RushDirection'].unique().tolist())

    # Clean and encode data 
    processor = DataProcessor()
    processed_data = processor.preprocess(df)

    # Train model
    model = train_model(processor=processed_data)

    # Run final evaluation
    evaluate_model(model, processor)

    # save model locally
    save_model(model, processor)


    # send to sage s3
    '''
        WARNING - potentially dangerous code
        uncommenting this code and running 'main.py'
        will update the AWS model connected to the EC2. 
        If it is not tested and working DO NOT UNCOMMENT. 
    '''
    #s3_uri = save_model_to_s3(model=model, processor=processor)
    #print(s3_uri)
