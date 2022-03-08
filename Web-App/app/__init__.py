import logging
from logging.handlers import RotatingFileHandler
import os

from flask import Flask
from config import Config
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager
from flask_bootstrap import Bootstrap
from flask_mail import Mail

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)
migrate = Migrate(app,db, compare_type=True)
login = LoginManager(app)
login.login_view = 'main.login'
bootstrap = Bootstrap(app)
mail = Mail(app)


#from app import routes,models
from app.main import bp as main_bp
app.register_blueprint(main_bp)

from app.models import User

@login.user_loader
def load_user(id):
        return User.query.get(int(id))

if True:
        if not os.path.exists('logs'):
                os.mkdir('logs')
        file_handler = RotatingFileHandler('logs/halfcaf.log', maxBytes=10240,
                                                                           backupCount=10)
        file_handler.setFormatter(logging.Formatter(
                '%(asctime)s %(levelname)s: %(message)s [in %(pathname)s:%(lineno)d]'))
        file_handler.setLevel(logging.INFO)
        app.logger.addHandler(file_handler)
        app.logger.setLevel(logging.DEBUG)
        app.logger.info('HalfCaf startup')

