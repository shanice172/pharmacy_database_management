
# Pharmacy Database Management System
This application is a database management system for pharmacies. It holds data for the following entities:
- Pharmacies
- Pharmacists
- Customers
- Doctors 
- Medications
- Insurance Companies

# Project Design
This project began through the creation of an ER diagram, where entities and relationships were originally mapped (see ER_diagram.png). During implementation, the structure of some tables were changed. For example, the relationship bewteen doctor/customer/medication was combined into one table for better functionality. 

### ORM Approach 
---
This application was built using ORM, instead of a raw SQL approach. This design was chosen to further develop my python and object-orientated programming skills. All tables were created using ORM. Some seed data was inserted using ORM, however most data was inserted via SQL statements in PostgreSQL.

### Technologies used:
---
- Flask 
- SQLAlchemy 
- psycopg2
- Python
- Docker
- PostgreSQL
- Insomnia



## REST API Endpoints
---
### Customers
| Name | HTTP Method | Path | Description |
|--------|--------|--------|--------|
| index | GET | /customers | Show all customers |
|  show | GET | /customers/id | Show customer by id |
| create | POST | /customers | Creates a new customer |
| delete | DEL | /customers/id | Deletes existing customer by id |

### Doctors
| Name | HTTP Method | Path | Description |
|--------|--------|--------|--------|
| index | GET | /doctors | Show all doctors |
|  show | GET | /doctors/id | Show doctor by id |
| create | POST | /doctors | Creates a new doctor |
| delete | DEL | /doctors/id | Deletes existing doctor by id |

### Pharmacies
| Name | HTTP Method | Path | Description |
|--------|--------|--------|--------|
| index | GET | /pharmacies | Show all pharmacies |
|  show | GET | /pharmacies/id | Show pharmacy by id |
| create | POST | /pharmacies | Creates a new pharmacy |
| delete | DEL | /pharmacies/id | Deletes existing pharmacy by id |

These API endpoints were tested through Insomnia.

## Future Developments
---
Improvements are still in store for this application. For example, data visualization through the use of matplotlib, pandas and numpy will be added, as well as an index.
