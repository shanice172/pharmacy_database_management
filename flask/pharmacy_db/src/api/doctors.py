from flask import Blueprint, jsonify, abort, request
from ..models import db, Doctor

bp = Blueprint('doctors', __name__, url_prefix='/doctors')

@bp.route('', methods=['GET'])
def index():
    doctors = Doctor.query.all()
    result = []
    for d in doctors:
        result.append(d.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    d = Doctor.query.get_or_404(id)
    return jsonify(d.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'first_name' not in request.json:
        return abort(400)

    d = Doctor(
        first_name=request.json['first_name'],
        last_name=request.json['last_name'],
        address=request.json['address'],
        phone_number=request.json['phone_number'],
        fax=request.json['fax']
    )

    db.session.add(d)
    db.session.commit()
    return jsonify(d.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    d = Doctor.query.get_or_404(id)
    try:
        db.session.delete(d)
        db.session.commit() 
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)