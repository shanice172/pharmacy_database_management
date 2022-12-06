"""
Populate database with fake data using the SQLAlchemy ORM.
"""

from pharmacy_db.src.models import Customer, db
from pharmacy_db.src import create_app
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('postgresql://postgres@localhost:5432/pharmacy_db_orm')
Session = sessionmaker(bind=engine)

customer_seed_data = [
    {'first_name': 'Bruno',
    'last_name': 'Mars', 
    'address': '11 Hills Beach Rd, Biddeford, Massachusetts',
    'phone_number': '207-602-5884',
    'date_of_birth': '1980-01-01'
    },
    {'first_name': 'Major',
    'last_name': 'Lazer', 
    'address': '41 North Madison St., Grand Island, NE',
    'phone_number': '686-832-8967',
    'date_of_birth': '1999-03-22'
    }
]

customer_objects = []
for item in customer_seed_data:
    c = Customer(first_name=item["first_name"], last_name=item["last_name"], address=item["address"], phone_number=item["phone_number"], date_of_birth=item["date_of_birth"])
    customer_objects.append(c)

db.session = Session()
db.session.bulk_save_objects(customer_objects)
db.session.commit()