import os
import sqlalchemy as sa
from flask import url_for
from app import db
from sqlalchemy.sql import func, text

class Trip(db.Model):
    __tablename__ = 'trips'

    id = db.Column(db.Integer, primary_key=True)
    phone_number = db.Column(db.String(100), unique=True, nullable=False)
    sms_code = db.Column(db.Integer, nullable=False)
    car = db.Column(db.String(100), nullable=False)
    car_plate = db.Column(db.String(100), nullable=False)
    fuel_level = db.Column(db.Integer, nullable=False)

    def check_password(self, password):
        return self.password_hash == password
    
    def __repr__(self):
        return '<Trip %r>' % self.phone_number
    

class Car(db.Model):
    __tablename__ = 'cars'

    id = db.Column(db.Integer, primary_key=True)
    car = db.Column(db.String(100), nullable=False)
    car_plate = db.Column(db.String(100), nullable=False)
    is_reserve = db.Column(db.Boolean, nullable=False, default=True)

    def __repr__(self):
        return '<Car %r>' % self.car
