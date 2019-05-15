from flask import Flask
import dlib
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'This server is running dlib version: {}'.format(dlib.__version__)

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')