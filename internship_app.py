from flask import Flask, request
from db_intern import db
from db_intern import Employee, Employer, Joboffer, PreferedPosition
import json


app = Flask(__name__)
db_filename = "cms.db"
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
        return failure_response("Incomplete field!")
    new_employee = Employee(name = name, gpa = gpa, location = location, picture = picture, past_work_experience = past_work_experience, start_month = start_month, end_month = end_month, email = email)
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

@app.route("/api/employers/", methods=["POST"])
def create_employer():
    body = json.loads(request.data)
    name = body.get('name')
    location = body.get('location')
    picture = body.get("picture", default_picture)
    if name is None or location is None :
        return failure_response("Incomplete field!")
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

@app.route("/api/employees/acceptOffer/", methods=["POST"])
def add_employer():
    employee = Employee.query.filter_by(id=employee_id).first()
    if employee is None:
        return failure_response('Employee not found!')
    body = json.loads(request.data)
    job_offer_id=body.get('job_offer_id')
    job_offer =  Joboffer.query.filter_by(id=job_offer_id).first()
    if job_offer is None:
        return failure_response('Employer not found!')
    # if body.get('type') is None:
    #     return failure_response('Type not found!')
    # if body.get('type') == "student":
    #     course.students.append(user)
    #     user.courses_s.append(course)
    # elif body.get('type') == "instructor":
    #     course.students.append(user)
    #     user.courses_i.append(course)
    #     print("instructor")
    # else:
    #    return failure_response("Invalid type!")
    if job_offer.open_slots < 1:
        return failure_response("Job offer unavailable")
    employee.job_accepted = job_offer_id
    job_offer.open_slots -= 1
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
    if name is None or start_month is None or end_month is None:
        return failure_response("Incomplete field!")
    if employer is None:
        return failure_response("Employer not found")
    new_job_offer = Joboffer(title=title, employer_id=employer_id, start_month = start_month, end_month = end_month)
    db.session.add(new_job_offer)
    db.session.commit()
    return success_response(new_job_offer.serialize())
#assignment routes

# @app.route("/api/courses/<int:course_id>/assignment/", methods=["POST"])
# def add_assignment(course_id):
#     course = Course.query.filter_by(id=course_id).first()
#     if course is None:
#         return failure_response('Course not found!')
#     body = json.loads(request.data)
#     title = body.get('title')
#     due_date = body.get('due_date')

#     if title is None or due_date is None:
#         return failure_response("Incomplete field!")
#     new_assignment = Assignment(title=title, due_date=due_date, course_id=course_id)
#     db.session.add(new_assignment)
#     db.session.commit()
#     response = new_assignment.serialize()
#     response["course"] = Course.query.filter_by(id = course_id).first().serialize()
#     return success_response(response)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
