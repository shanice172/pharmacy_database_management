import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Customer(db.Model):
    __tablename__ = 'customers'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    address = db.Column(db.String(255), nullable=False)
    phone_number = db.Column(db.String(12), nullable=False)
    email = db.Column(db.String(255))
    date_of_birth = db.Column(db.DateTime, default=datetime.date, nullable=False)

    def __init__(self, first_name: str, last_name: str, address: str, phone_number: str, email: str, date_of_birth:str):
        self.first_name = first_name
        self.last_name = last_name
        self.address = address
        self.phone_number = phone_number
        self.email = email
        self.date_of_birth = date_of_birth

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'address': self.address,
            'phone_number': self.phone_number,
            'email': self.email,
            'date_of_birth': self.date_of_birth.isoformat()
        }

class Doctor(db.Model):
    __tablename__ = 'doctors'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    address = db.Column(db.String(255), nullable=False)
    phone_number = db.Column(db.String(12), nullable=False)
    fax = db.Column(db.String(12))

    def __init__(self, first_name: str, last_name: str, address: str, phone_number: str, fax: str):
        self.first_name = first_name
        self.last_name = last_name
        self.address = address
        self.phone_number = phone_number
        self.fax = fax

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'address': self.address,
            'phone_number': self.phone_number,
            'fax': self.fax
        }

class Pharmacy(db.Model):
    __tablename__ = 'pharmacies'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    pharmacy_name = db.Column(db.Text, nullable=False)
    pharmacy_address = db.Column(db.String(255), nullable=False)
    phone_number = db.Column(db.String(12), nullable=False)
    fax = db.Column(db.String(12))

    def __init__(self, pharmacy_name: str, pharmacy_address: str, phone_number: str, fax: str):
        self.pharmacy_name = pharmacy_name
        self.pharmacy_address = pharmacy_address
        self.phone_number = phone_number
        self.fax = fax

    def serialize(self):
        return {
            'id': self.id,
            'pharmacy_name': self.pharmacy_name,
            'pharmacy_address': self.pharmacy_address,
            'phone_number': self.phone_number,
            'fax': self.fax
        }

class Pharmacist(db.Model):
    __tablename__ = 'pharmacists'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)

class Medication(db.Model):
    __tablename__ = 'medications'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    medication_name = db.Column(db.Text, nullable=False, unique=True)
    manufacturer = db.Column(db.Text, nullable=False)

class Insurance(db.Model):
    __tablename__ = 'insurances'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    company_name = db.Column(db.Text, nullable=False)
    rxbin = db.Column(db.Integer, nullable=False)
    rxgrp = db.Column(db.String(8), nullable=False)
    active = db.Column(db.Boolean, nullable=False)

doctors_customers_table = db.Table(
    'doctors_customers',
    db.Column(
        'doctor_id', db.Integer,
        db.ForeignKey('doctors.id'),
        primary_key=True
    ),

    db.Column(
        'customer_id', db.Integer,
        db.ForeignKey('customers.id'),
        primary_key=True
    )
)

customers_insurances_table = db.Table(
    'customers_insurances',
    db.Column(
        'customer_id', db.Integer,
        db.ForeignKey('customers.id'),
        primary_key=True
    ),

    db.Column(
        'insurance_id', db.Integer,
        db.ForeignKey('insurances.id'),
        primary_key=True
    )
)

medications_doctors_customers_table = db.Table(
    'medications_doctors_customers',
    db.Column(
        'medication_id', db.Integer,
        db.ForeignKey('medications.id'),
        primary_key=True
    ),

    db.Column(
        'doctor_id', db.Integer,
        db.ForeignKey('doctors.id'),
        primary_key=True
    ),

    db.Column(
        'customer_id', db.Integer,
        db.ForeignKey('customers.id'),
        primary_key=True
    ),

    db.Column(
        'dosage', db.String(255),
        nullable=False
    ),

    db.Column(
        'refills', db.Integer,
        nullable=False
    ),

    db.Column(
        'date_received', db.DateTime,
        default=datetime.date,
        nullable=False
    )
)

pharmacies_medications_table = db.Table(
    'pharmacies_medications',
    db.Column(
        'pharmacy_id', db.Integer,
        db.ForeignKey('pharmacies.id'),
        primary_key=True
    ),

    db.Column(
        'medication_id', db.Integer,
        db.ForeignKey('medications.id'),
        primary_key=True
    ),

    db.Column(
        'price', db.Numeric(19,2),
        nullable=False
    )
)

pharmacists_medications_table = db.Table(
    'pharmacists_medications',
    db.Column(
        'pharmacist_id', db.Integer,
        db.ForeignKey('pharmacists.id'),
        primary_key=True
    ),

    db.Column(
        'medication_id', db.Integer,
        db.ForeignKey('medications.id'),
        primary_key=True
    ),

    db.Column(
        'time_filled', db.DateTime,
        default=datetime.date,
        nullable=False
    )
)