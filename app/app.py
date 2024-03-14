from flask import Flask, render_template, request, flash, redirect
from sqlalchemy import MetaData
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
import math

app = Flask(__name__)

application = app

app.config.from_pyfile('config.py')

convention = {
    "ix": 'ix_%(column_0_label)s',
    "uq": "uq_%(table_name)s_%(column_0_name)s",
    "ck": "ck_%(table_name)s_%(constraint_name)s",
    "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
    "pk": "pk_%(table_name)s"
}

metadata = MetaData(naming_convention=convention)
db = SQLAlchemy(app, metadata=metadata)
migrate = Migrate(app, db)


from models import *

TRIP_PARAMS = [
    'phone_number', 'sms_code'
]

def params():
    return { p: request.form.get(p) for p in TRIP_PARAMS }

@app.route('/', methods=['GET','POST'])
def index():
    if request.method == 'GET':
        cars = db.session.execute(db.select(Car)).scalars()
        return render_template('index.html', cars=cars)
    if request.method == 'POST':
        params_from_form = params()
        trip = db.session.execute(db.select(Trip).filter(Trip.phone_number == f'+{params_from_form["phone_number"]}')).scalar()
        if int(trip.sms_code) != int(params_from_form['sms_code']):
            flash('Введены неверные данные','warning')
            return redirect(url_for('index'))
        return render_template('trip.html', trip=trip)
