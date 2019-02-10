__author__ = "Tomasz Cieplak"

import pandas as pd
import numpy as np
from sklearn import linear_model
import pickle

#loading our data as a panda
df = pd.read_csv('./data/winequality-red.csv', delimiter=";")

#getting only the column called quality
label = df['quality']

#getting every column except for quality
features = df.drop('quality', axis=1)

#defining our linear regression estimator and training it with our wine data
regr = linear_model.LinearRegression()
regr.fit(features, label)

#using our trained model to predict a fake wine
#each number represents a feature like pH, acidity, etc.
print(regr.predict([[7.4,0.66,0,1.8,0.075,13,40,0.9978,3.51,0.56,9.4]]).tolist())

#serializing our model to a file called model.pkl
with open("model.pkl", "wb") as fw:
    pickle.dump(regr, fw)
    del regr

#loading a model from a file called model.pkl
with open("model.pkl", "rb") as fr:
    model = pickle.load(fr)