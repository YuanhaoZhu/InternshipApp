from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy() #db is an instance of sqlalchemy

association_table1 = db.Table(
	"association_table1",
	db.Model.metadata,
	db.Column("employee_id", db.Integer, db.ForeignKey("employee.id")),   
	db.Column("employer_id", db.Integer, db.ForeignKey("employer.id"))
)

# association_table2 = db.Table(
# 	"association_table2",
# 	db.Model.metadata,
# 	db.Column("course_id", db.Integer, db.ForeignKey("course.id")),   
#     db.Column("student_id", db.Integer, db.ForeignKey("user.id"))
# )

# your classes here
class Employee(db.Model):
    __tablename__ = 'employee' #same name as py class
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    gpa = db.Column(db.Float, nullable=False)
    location = db.Column(db.String, nullable=False)
    picture = db.Column(db.String, nullable=False)
    #assignments = db.relationship('Assignment', cascade = 'delete') #when delete task go ahead to delete subtasks
    #employers = db.relationship('Employer', secondary = association_table1, back_populates='employees')
    # students = db.relationship('User', secondary = association_table2, back_populates='courses_s')
    job_accepted = db.Column(db.Integer, nullable=False) # not using foreign key, because want to use -1 to represent None
    past_work_experience = db.Column(db.String)
    start_month = db.Column(db.Integer, nullable=False)
    end_month = db.Column(db.Integer, nullable=False)
    email = db.Column(db.String)
    

    def __init__(self, **kwargs):
        self.name = kwargs.get('name', "")
        self.gpa = kwargs.get('gpa', 0)
        self.location = kwargs.get('location', "")
        self.picture = kwargs.get("picture", "")
        self.past_work_experience = kwargs.get("past_work_experience", "")
        self.start_month = kwargs.get("start_month", 0)
        self.end_month = kwargs.get("end_month", 0)
        self.email = kwargs.get("email", "")
        self.job_accepted = -1
        
    def serialize(self):
        return{
            'id': self.id,
            'name':self.name,
            'location': self.location,
            "picture": self.picture,
            "gpa": self.gpa,
            "past_work_experience": self.past_work_experience,
            "start_month": self.start_month,
            "end_month": self.end_month,
            "job_accepted": "None" if self.job_accepted == -1 else Joboffer.query.filter_by(id = self.job_accepted).first().title,
            "prefered_position": [t.title for t in PreferedPosition.query.filter_by(employee_id=self.id).all()]
            #'employers': [t.serialize() for t in self.employers],
            # 'instructors':[t.serialize() for t in self.instructors],
            # 'students': [t.serialize() for t in self.students],
        }

    # def serialize2(self):
    #     return{
    #         'id': self.id,
    #         'code': self.code,
    #         'name': self.name,
    #         'assignments': [],
    #         'instructors':[],
    #         'students': [],
    #     }
class PreferedPosition(db.Model):
    __tablename__ = 'preferedposition'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    employee_id = db.Column(db.Integer, db.ForeignKey('employee.id'), nullable=False)
    employer_id = db.Column(db.Integer, db.ForeignKey('employer.id'), nullable=False)
    start_month = db.Column(db.Integer, nullable=False)
    end_month = db.Column(db.Integer, nullable=False)
    open_slots = db.Column(db.Integer, nullable=False)

    def __init__(self, **kwargs):
        self.title = kwargs.get('title', '')
	self.employee_id = kwargs.get('employee_id')
        self.employer_id = kwargs.get('employer_id')
        self.start_month = kwargs.get("start_month", 0)
        self.end_month = kwargs.get("end_month", 0)
        self.open_slots = kwargs.ger("open_slots", 0)
    
    def serialize(self):
        return{
            'id': self.id,
            'title': self.title,
            'employee_id': self.employee_id,
            'employer_id': self.employer_id,
	    'start_month': self.start_month,
	    'end_month': self.end_month,
	    'open_slots': self.open_slots,
        }
    
class Employer(db.Model):
    __tablename__ = 'employer'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    location = db.Column(db.String, nullable=False)
    picture = db.Column(db.String, nullable=False)
    # employees = db.relationship('Employee', secondary = association_table2, back_populates='employers')
    # courses_i = db.relationship('Course', secondary = association_table1, back_populates='instructors')   

    def __init__(self, **kwargs):
        self.name = kwargs.get('name', '')
        self.location = kwargs.get('netid', "")
        self.picture = kwargs.get("picture", "")
        # self.employee_id = kwargs.get('employee_id')

    def serialize(self):
        return{
        'id': self.id,
        'name': self.name,
        'location':self.location,
        "picture": self.picture,
        "job_offer": [t.title for t in Joboffer.query.filter_by(employer_id=self.id).all()]
        #'employees': [],
    }

    # def serialize2(self):
    #     course = []
    #     for c in self.courses_s:
    #         course.append(c.serialize2()) 
    #     for c in self.courses_i:
    #         course.append(c.serialize2()) 
    #     return{
    #         'id': self.id,
    #         'name': self.name,
    #         'netid': self.netid,
    #         'courses': course,
    #     }
        
class Joboffer(db.Model):
    __tablename__ = 'joboffer'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    employer_id = db.Column(db.Integer, db.ForeignKey('employer.id'), nullable=False)
    start_month = db.Column(db.Integer, nullable=False)
    end_month = db.Column(db.Integer, nullable=False)
    open_slots = db.Column(db.Integer, nullable=False)

    def __init__(self, **kwargs):
        self.title = kwargs.get('title', '')
        self.employer_id = kwargs.get('employer_id')
        self.start_month = kwargs.get("start_month", 0)
        self.end_month = kwargs.get("end_month", 0)
        self.open_slots = kwargs.ger("open_slots", 0)
       
    def serialize(self):
        return{
            'id': self.id,
            'title': self.title,
            'employer_id': int(self.duration),
	    'start_month': self.start_month,
	    'end_month': self.end_month,
	    'open_slots': self.open_slots,
        }


