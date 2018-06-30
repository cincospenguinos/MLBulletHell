from flask import Flask
from sqlalchemy import create_engine

db_engine = create_engine('sqlite:///:memory:', echo = True)

app = Flask(__name__)

@app.route('/')
def index():
	return 'Hello, world!'