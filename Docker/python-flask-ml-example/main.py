# https://medium.freecodecamp.org/a-beginners-guide-to-training-and-deploying-machine-learning-models-using-python-48a313502e5a

from pickle import load
from flask import jsonify, Flask
from flask import request
from flask_restplus import Api, Resource, fields, cors
from flask_cors import CORS, cross_origin

# adding swagger UI 
# https://pypi.org/project/flask-swagger-ui/

from flask_swagger_ui import get_swaggerui_blueprint

app = Flask(__name__)
# enabling CORS
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'


api = Api(app, version='1.0', title='Classification API',
    description='A regression API for white and red whine',
)
# name space 
ns = api.namespace('', description='Operations for Regression API')

SWAGGER_URL = '/api/docs' # URL for exposing Swagger UI (without trailing '/')
API_URL = 'http://petstore.swagger.io/v2/swagger.json' # Our API url (can of course be a local resource)

# Call factory function to create our blueprint
#swaggerui_blueprint = get_swaggerui_blueprint(
#SWAGGER_URL, # Swagger UI static files will be #mapped to '{SWAGGER_URL}/dist/'
#API_URL,
config={ # Swagger UI config overrides
'app_name': "Test application"
},
# oauth_config={ # OAuth config. See https://github.com/swagger-api/swagger-ui#oauth2-configuration .
# 'clientId': "your-client-id",
# 'clientSecret': "your-client-secret-if-required",
# 'realm': "your-realms",
# 'appName': "your-app-name",
# 'scopeSeparator': " ",
# 'additionalQueryStringParams': {'test': "hello"}
# }
)

# Register blueprint at URL
# (URL must match the one given to factory function above)
#app.register_blueprint(swaggerui_blueprint, url_prefix=SWAGGER_URL)

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
