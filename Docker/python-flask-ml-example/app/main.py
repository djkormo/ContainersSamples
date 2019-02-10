# https://medium.freecodecamp.org/a-beginners-guide-to-training-and-deploying-machine-learning-models-using-python-48a313502e5a

from pickle import load
from flask import jsonify, Flask
from flask import request

app = Flask(__name__)

# loading a model from a file called model.pkl
with open("model.pkl", "rb") as fr:
    model = load(fr)


@app.route('/predict', methods=['POST'])
def index():
    # getting an array of features from the request's body
    feature_array = request.get_json(force=True)['feature_array']
    print(feature_array)
    # creating a response object
    # storing the model's prediction in the object
    response = {}
    response['prediction'] = model.predict([feature_array]).tolist()

    return jsonify(response)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=80)
