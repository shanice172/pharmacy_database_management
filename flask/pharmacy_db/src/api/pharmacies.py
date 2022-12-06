from flask import Blueprint, jsonify, abort, request
from ..models import db, Pharmacy

bp = Blueprint('pharmacies', __name__, url_prefix='/pharmacies')

@bp.route('', methods=['GET'])
def index():
    pharmacies = Pharmacy.query.all()
    result = []
    for p in pharmacies:
        result.append(p.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    p = Pharmacy.query.get_or_404(id)
    return jsonify(p.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'pharmacy_name' not in request.json:
        return abort(400)

    p = Pharmacy(
        pharmacy_name=request.json['pharmacy_name'],
        pharmacy_address=request.json['pharmacy_address'],
        phone_number=request.json['phone_number'],
        fax=request.json['fax']
    )

    db.session.add(p)
    db.session.commit()
    return jsonify(p.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    p = Pharmacy.query.get_or_404(id)
    try:
        db.session.delete(p)
        db.session.commit() 
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)