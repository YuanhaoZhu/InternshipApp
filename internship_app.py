from flask import Flask, request
from db_intern import db
from db_intern import Employee, Employer, Joboffer, PreferedPosition
import json
import os

app = Flask(__name__)
db_filename = "data.db"
default_picture = "someLink.jpg"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

#initialize app
db.init_app(app)
with app.app_context():
    db.create_all()

#generalized response formats
def success_response(data, code=200):
    return json.dumps({"success": True, "data": data}), code

def failure_response(message, code=404):
    return json.dumps({"success": False, "error": message}), code

def month_to_int(mon):
    if mon == "Jan":
        return 1
    elif mon == "Feb":
        return 2
    elif mon == "Mar":
        return 3
    elif mon == "Apr":
        return 4
    elif mon == "May":
        return 5
    elif mon == "Jun":
        return 6
    elif mon == "Jul":
        return 7
    elif mon == "Aug":
        return 8
    elif mon == "Sep":
        return 9
    elif mon == "Oct":
        return 10
    elif mon == "Nov":
        return 11
    elif mon == "Dec":
        return 12
    else:
        return 0
# your routes here
#@app.route("/")
@app.route("/api/employees/")
def get_employees():
    return success_response([t.serialize() for t in Employee.query.all()])

@app.route("/api/employees/", methods=["POST"])
def create_employees():
    body = json.loads(request.data)
    name = body.get('name')
    gpa = body.get('gpa')
    location = body.get('location')
    picture = body.get("picture", default_picture)
    past_work_experience = body.get("past_work_experience", "")
    start_month = body.get("start_month")
    end_month = body.get("end_month")
    email = body.get("email")
    if name is None or gpa is None or location is None or start_month is None or end_month is None:
        return failure_response("Incomplete field!", 400)
    new_employee = Employee(name = name, gpa = gpa, location = location, picture = picture, past_work_experience = past_work_experience, start_month = month_to_int(start_month), end_month = month_to_int(end_month), email = email)
    print("new_employee:",new_employee)
    db.session.add(new_employee)
    db.session.commit()
    return success_response(new_employee.serialize(), 201)

@app.route("/api/employees/<int:employee_id>/", methods=["DELETE"])
def delete_employee(employee_id):
    employee = Employee.query.filter_by(id=employee_id).first()
    if employee is None:
        return failure_response('Employee not found!')
    db.session.delete(employee)
    db.session.commit()
    return success_response(employee.serialize())

@app.route("/api/employees/<int:employee_id>/")
def get_employee(employee_id):
    employee = Employee.query.filter_by(id=employee_id).first()
    if employee is None:
        return failure_response('Employee not found!')
    return success_response(employee.serialize())

@app.route("/api/employers/")
def get_employers():
    return success_response([t.serialize() for t in Employer.query.all()])

@app.route("/api/employers/", methods=["POST"])
def create_employer():
    body = json.loads(request.data)
    name = body.get('name')
    location = body.get('location')
    picture = body.get("picture", default_picture)
    if name is None or location is None :
        return failure_response("Incomplete field!", 400)
    new_employer = Employer(name=name, location=location, picture = picture)
    db.session.add(new_employer)
    db.session.commit()
    return success_response(new_employer.serialize(), 201)

@app.route("/api/employers/<int:employer_id>/")
def get_employer(employer_id):
    employer = Employer.query.filter_by(id=employer_id).first()
    if employer is None:
        return failure_response('Employer not found!')
    return success_response(employer.serialize())

@app.route("/api/employers/<int:employer_id>/", methods = ["DELETE"])
def delete_employer(employer_id):
    employer = Employer.query.filter_by(id=employer_id).first()
    if employer is None:
        return failure_response('Employer not found!')
    db.session.delete(employer)
    db.session.commit()
    return success_response(employer.serialize())

@app.route("/api/employees/<int:employee_id>/acceptOffer/", methods=["POST"])
def accept_offer(employee_id):
    employee = Employee.query.filter_by(id=employee_id).first()
    if employee is None:
        return failure_response('Employee not found!')
    body = json.loads(request.data)
    job_offer_id=body.get('job_offer_id')
    job_offer =  Joboffer.query.filter_by(id=job_offer_id).first()
    if job_offer is None:
        return failure_response('Job offer not found!', 400)
    if job_offer.open_slots < 1:
        return failure_response("Job offer unavailable", 400)
    if employee.job_accepted != -1:
        return failure_response("Already accepted a job", 400)
    employee.job_accepted = job_offer_id
    job_offer.open_slots -= 1
    db.session.commit()
    return success_response(employee.serialize())

@app.route("/api/employees/<int:employee_id>/rejectOffer/")
def reject_offer(employee_id):
    employee = Employee.query.filter_by(id=employee_id).first()
    if employee is None:
        return failure_response('Employee not found!')
    if employee.job_accepted == -1:
        return failure_response("No job offer to reject", 400)
    job_offer_id = employee.job_accepted
    job_offer =  Joboffer.query.filter_by(id=job_offer_id).first()
    if job_offer is None:
        return failure_response('Job offer not found!', 400)
    job_offer.open_slots += 1
    employee.job_accepted = -1
    db.session.commit()
    return success_response(employee.serialize())

@app.route("/api/employees/<int:employee_id>/add_position/", methods=["POST"])
def add_preferred_position(employee_id):
    employee = Employee.query.filter_by(id=employee_id).first()
    if employee is None:
        return failure_response('Employee not found!')
    body = json.loads(request.data)
    position=body.get('position')
    if position is None:
        return failure_response('Missing position', 400)
    pos = PreferedPosition.query.filter_by(title=position, employee_id=employee_id).first()
    if pos is not None:
        return failure_response("Position already added", 400)
    new_pos = PreferedPosition(title=position, employee_id=employee_id)
    db.session.add(new_pos)
    db.session.commit()
    return success_response(employee.serialize())

@app.route("/api/employees/<int:employee_id>/remove_position/", methods=["POST"])
def remove_preferred_position(employee_id):
    employee = Employee.query.filter_by(id=employee_id).first()
    if employee is None:
        return failure_response('Employee not found!')
    body = json.loads(request.data)
    position=body.get('position')
    if position is None:
        return failure_response('Missing position', 400)
    pos = PreferedPosition.query.filter_by(title=positon, employee_id=employee_id)
    if pos is None:
        return failure_response("Position not preferred by current emoloyee")
    db.session.delete(pos)
    db.session.commit()
    return success_response(employee.serialize())

@app.route("/api/job_offers/", methods=["POST"])
def create_job_offer():
    body = json.loads(request.data)
    title = body.get('title')
    employer_id = body.get('employer_id')
    start_month = body.get("start_month")
    end_month = body.get("end_month")
    employer = Employer.query.filter_by(id=employer_id).first()
    position = body.get("position", "Any")
    if name is None or start_month is None or end_month is None:
        return failure_response("Incomplete field!", 400)
    if employer is None:
        return failure_response("Employer not found")
    new_job_offer = Joboffer(title=title, employer_id=employer_id, start_month = month_to_int(start_month), end_month = month_to_int(end_month), position = position)
    db.session.add(new_job_offer)
    db.session.commit()
    return success_response(new_job_offer.serialize())

@app.route("/api/job_offers/")
def get_job_offers():
    return success_response([t.serialize() for t in Joboffer.query.all()])

@app.route("/api/job_offers/<int:job_offer_id>/")
def get_job_offer(job_offer_id):
    job_offer = Joboffer.query.filter_by(id=job_offer_id).first()
    if job_offer is None:
        return failure_response('job offer not found!')
    return success_response(job_offer.serialize())

@app.route("/api/job_offers/<int:job_offer_id>/", methods=["DELETE"])
def delete_job_offer(job_offer_id):
    job_offer = Joboffer.query.filter_by(id=job_offer_id).first()
    if job_offer is None:
        return failure_response('job offer not found!')
    db.session.delete(job_offer)
    for e in Employee.query.filter_by(job_accepted=job_offer_id).all():
        e.job_accepted = -1
    db.session.commit()
    return success_response(job_offer.serialize())

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
