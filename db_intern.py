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
    #assignments = db.relationship('Assignment', cascade = 'delete') #when delete task go ahead to delete subtasks
    employers = db.relationship('Employer', secondary = association_table1, back_populates='employees')
    # students = db.relationship('User', secondary = association_table2, back_populates='courses_s')

    def __init__(self, **kwargs):
        self.name = kwargs.get('name', False)
        self.gpa = kwargs.get('gpa', False)
        self.location = kwargs.get('location', False)

    def serialize(self):
        return{
            'id': self.id,
            'name':self.name,
            'location': self.location,
            'employers': [t.serialize() for t in self.employers],
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

class Employer(db.Model):
    __tablename__ = 'employer'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    location = db.Column(db.String, nullable=False)
    employees = db.relationship('Employee', secondary = association_table2, back_populates='employers')
    # courses_i = db.relationship('Course', secondary = association_table1, back_populates='instructors')   

    def __init__(self, **kwargs):
        self.name = kwargs.get('name', '')
        self.location = kwargs.get('netid', False)
        self.employee_id = kwargs.get('employee_id')

    def serialize(self):
        return{
        'id': self.id,
        'name': self.name,
        'location':self.location,
        'employees': [],
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
    duration = db.Column(db.Integer, nullable=False)
    employer_id = db.Column(db.Integer, db.ForeignKey('employer.id'), nullable=False) #foreign key must be table name

    def __init__(self, **kwargs):
        self.title = kwargs.get('title', '')
        self.duration  = kwargs.get('due_date')
        self.employer_id = kwargs.get('employer_id')
       
    def serialize(self):
        return{
            'id': self.id,
            'title': self.title,
            'due_date': int(self.duration),
        }


