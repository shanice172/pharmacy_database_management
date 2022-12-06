"""empty message

Revision ID: 4a976b3d8da1
Revises: 
Create Date: 2022-11-18 13:41:40.497598

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '4a976b3d8da1'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('customers',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('first_name', sa.Text(), nullable=False),
    sa.Column('last_name', sa.Text(), nullable=False),
    sa.Column('address', sa.String(length=255), nullable=False),
    sa.Column('phone_number', sa.String(length=12), nullable=False),
    sa.Column('email', sa.String(length=255), nullable=True),
    sa.Column('date_of_birth', sa.DateTime(), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('doctors',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('first_name', sa.Text(), nullable=False),
    sa.Column('last_name', sa.Text(), nullable=False),
    sa.Column('address', sa.String(length=255), nullable=False),
    sa.Column('phone_number', sa.String(length=12), nullable=False),
    sa.Column('fax', sa.String(length=12), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('insurances',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.Text(), nullable=False),
    sa.Column('rxbin', sa.Integer(), nullable=False),
    sa.Column('rxgrp', sa.String(length=8), nullable=False),
    sa.Column('active', sa.Boolean(), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('medications',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('medication_name', sa.Text(), nullable=False),
    sa.Column('manufacturer', sa.Text(), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('medication_name')
    )
    op.create_table('pharmacies',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.Text(), nullable=False),
    sa.Column('address', sa.String(length=255), nullable=False),
    sa.Column('phone_number', sa.String(length=12), nullable=False),
    sa.Column('fax', sa.String(length=12), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('pharmacists',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('first_name', sa.Text(), nullable=False),
    sa.Column('last_name', sa.Text(), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('customers_insurances',
    sa.Column('customer_id', sa.Integer(), nullable=False),
    sa.Column('insurance_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['customer_id'], ['customers.id'], ),
    sa.ForeignKeyConstraint(['insurance_id'], ['insurances.id'], ),
    sa.PrimaryKeyConstraint('customer_id', 'insurance_id')
    )
    op.create_table('doctors_customers',
    sa.Column('doctor_id', sa.Integer(), nullable=False),
    sa.Column('customer_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['customer_id'], ['customers.id'], ),
    sa.ForeignKeyConstraint(['doctor_id'], ['doctors.id'], ),
    sa.PrimaryKeyConstraint('doctor_id', 'customer_id')
    )
    op.create_table('medications_doctors_customers',
    sa.Column('medication_id', sa.Integer(), nullable=False),
    sa.Column('doctor_id', sa.Integer(), nullable=False),
    sa.Column('customer_id', sa.Integer(), nullable=False),
    sa.Column('dosage', sa.String(length=255), nullable=False),
    sa.Column('refills', sa.Integer(), nullable=False),
    sa.Column('date_received', sa.DateTime(), nullable=False),
    sa.ForeignKeyConstraint(['customer_id'], ['customers.id'], ),
    sa.ForeignKeyConstraint(['doctor_id'], ['doctors.id'], ),
    sa.ForeignKeyConstraint(['medication_id'], ['medications.id'], ),
    sa.PrimaryKeyConstraint('medication_id', 'doctor_id', 'customer_id')
    )
    op.create_table('pharmacies_medications',
    sa.Column('pharmacy_id', sa.Integer(), nullable=False),
    sa.Column('medication_id', sa.Integer(), nullable=False),
    sa.Column('price', sa.Numeric(precision=19, scale=2), nullable=False),
    sa.ForeignKeyConstraint(['medication_id'], ['medications.id'], ),
    sa.ForeignKeyConstraint(['pharmacy_id'], ['pharmacies.id'], ),
    sa.PrimaryKeyConstraint('pharmacy_id', 'medication_id')
    )
    op.create_table('pharmacists_medications',
    sa.Column('pharmacist_id', sa.Integer(), nullable=False),
    sa.Column('medication_id', sa.Integer(), nullable=False),
    sa.Column('time_filled', sa.DateTime(), nullable=False),
    sa.ForeignKeyConstraint(['medication_id'], ['medications.id'], ),
    sa.ForeignKeyConstraint(['pharmacist_id'], ['pharmacists.id'], ),
    sa.PrimaryKeyConstraint('pharmacist_id', 'medication_id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('pharmacists_medications')
    op.drop_table('pharmacies_medications')
    op.drop_table('medications_doctors_customers')
    op.drop_table('doctors_customers')
    op.drop_table('customers_insurances')
    op.drop_table('pharmacists')
    op.drop_table('pharmacies')
    op.drop_table('medications')
    op.drop_table('insurances')
    op.drop_table('doctors')
    op.drop_table('customers')
    # ### end Alembic commands ###
