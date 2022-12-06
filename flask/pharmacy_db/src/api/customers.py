from flask import Blueprint, jsonify, abort, request
from ..models import Customer, db

bp = Blueprint('customers', __name__, url_prefix='/customers')

@bp.route('', methods=['GET'])
def index():
    customers = Customer.query.all()
    result = []
    for c in customers:
        result.append(c.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    c = Customer.query.get_or_404(id)
    return jsonify(c.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'first_name' not in request.json:
        return abort(400)

    c = Customer(
        first_name=request.json['first_name'],
        last_name=request.json['last_name'],
        address=request.json['address'],
        phone_number=request.json['phone_number'],
        email=request.json['email'],
        date_of_birth=request.json['date_of_birth']
    )

    db.session.add(c)
    db.session.commit()
    return jsonify(c.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    c = Customer.query.get_or_404(id)
    try:
        db.session.delete(c)
        db.session.commit() 
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)