# InternshipApp
backend:
all failure responses are {"success": False, "error": the error message}

let link = the heroku link for the app

link/api/employees/ [GET] returns a list of all employees
returns json file {"success": true, "data": [{
            'id': employee1 id,
            'name':employee1 name,
            'location': employee1 location,
            "picture":  employee1 picture,
            "gpa": employee1 gpa,
            "past_work_experience": employee1 past_work_experience,
            "start_month": employee1 start_month,
            "end_month": employee1 end_month,
            "job_accepted": id of the job accepted employee1,
            "prefered_position": list of prefered positions of employee1,
            "email": email of employee1
        }, 
        {
            'id': employee2 id,
            'name':employee2 name,
            'location': employee2 location,
            "picture":  employee2 picture,
            "gpa": employee2 gpa,
            "past_work_experience": employee2 past_work_experience,
            "start_month": employee2 start_month,
            "end_month": employee2 end_month,
            "job_accepted": id of the job accepted employee2,
            "prefered_position": list of prefered positions of employee2,
            "email": email of employee2
        }, 
        ...]}

link/api/employees/ [POST] takes input json to create an employee
requires input {
            'name':employee1 name,
            'location': employee1 location,
            "picture":  employee1 picture,
            "gpa": employee1 gpa,
            "past_work_experience": employee1 past_work_experience,
            "start_month": employee1 start_month,
            "end_month": employee1 end_month,
            "job_accepted": id of the job accepted employee1,
            "email": email of employee1
        }
returns the information of the newly created employee
{"success": true, "data": {
            'id': employee1 id,
            'name':employee1 name,
            'location': employee1 location,
            "picture":  employee1 picture,
            "gpa": employee1 gpa,
            "past_work_experience": employee1 past_work_experience,
            "start_month": employee1 start_month,
            "end_month": employee1 end_month,
            "job_accepted": id of the job accepted employee1,
            "prefered_position": list of prefered positions of employee1, (should be empty)
            "email": email of employee1
        }}

link/api/employees/<int:employee_id>/ [DELETE] deletes the employee with id employee_id
returns information of the deleted employee
{"success": true, "data": {
            'id': employee1 id,
            'name':employee1 name,
            'location': employee1 location,
            "picture":  employee1 picture,
            "gpa": employee1 gpa,
            "past_work_experience": employee1 past_work_experience,
            "start_month": employee1 start_month,
            "end_month": employee1 end_month,
            "job_accepted": id of the job accepted employee1,
            "prefered_position": list of prefered positions of employee1,
            "email": email of employee1
        }}

link/api/employers/ [POST] Creates an employer
requires input 
    {
        'name': employer name,
        'location': employer location,
        "picture": employer picture,
    }
returns the information of the new employer
{
        'id': employer id,
        'name': employer name,
        'location':employer location,
        "picture": employer picture,
        "job_offer": list of job offers (should be empty at the start)
}

link/api/employers/<int:employer_id>/ [GET] returns the employer with id employer id
{"success": true, "data": {
        'id': employer id,
        'name': employer name,
        'location':employer location,
        "picture": employer picture,
        "job_offer": list of job offers (should be empty at the start)
}}

link/api/employees/<int:employee_Id>/acceptOffer/ [POST] Let an employee with id employee_id accept a job offer
requires input 
{
"job_offer_id": the id of the job offer
}
Will fail if no open slots are available
returns success response with the information of the employee

link/api/job_offers/ [POST] create a job offer
requires input
{
    'title': job offer title,
    'employer_id': employer id it belongs to,
	'start_month': start month,
	'end_month': end month,
	'open_slots': open_slots,
}
returns {"success": true, "data": {
    'id': job offer id,
    'title': job offer title,
    'employer_id': employer id it belongs to,
	'start_month': start month,
	'end_month': end month,
	'open_slots': open_slots,
}}