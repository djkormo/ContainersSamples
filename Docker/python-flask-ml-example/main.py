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

@ns.route('/health')  #  Create a URL route to this resource
class HelloWorld(Resource):            #  Create a RESTful resource
  def get(self):                     #  Create GET endpoint
    #return {'hello': 'world'}
    return '', 200'
	

# loading a model from a file called model.pkl
with open("model.pkl", "rb") as fr:
    model = load(fr)


@ns.route("/abc")
@cross_origin() # allow all origins all methods.
def helloWorld():
  return "Hello, cross-origin-world!"    
  

# 4MB Max image size limit
app.config['MAX_CONTENT_LENGTH'] = 4 * 1024 * 1024 

# Default route just shows simple text
@app.route('/')
def index():
    return 'Python wine model '

	

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


#if __name__ == '__main__':
#    app.run(host='0.0.0.0', debug=True, port=80)
	
#if __name__ == '__main__':
    # Load and intialize the model
    initialize()
	
    # Run the server
    app.run(host='0.0.0.0',debug=True, port=80)
