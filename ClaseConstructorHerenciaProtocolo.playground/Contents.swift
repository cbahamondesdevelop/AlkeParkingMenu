import UIKit

protocol Persona {
    
    var ID:Int { get set }
    var lastName:String { get set }
    var firstMidName:String { get set }
}

class OfficeAssignment {
    
//    var instructors:[Instructor] = []
    
    let instructorID:Int
    let location:String
    
    init (instructorID:Int, location:String){
        self.instructorID = instructorID
        self.location = location
    }
}

class Student : Persona {
    
    var enrollments:[enrollment] = []
    
    var ID:Int
    var lastName:String
    var firstMidName:String
    var enrollmentDate:String
    
    init (ID:Int, lastName:String, firstMidName:String, enrollmentDate:String){
        self.ID = ID
        self.lastName = lastName
        self.firstMidName = firstMidName
        self.enrollmentDate = enrollmentDate
    }
}

class Instructor :Persona {
    
    var coursosAsignados:[Course] = []
    var departamentos:[Department] = []
    
    var ID:Int
    var lastName:String
    var firstMidName:String
    
    init (ID:Int, lastName:String, firstMidName:String) {
        self.ID = ID
        self.lastName = lastName
        self.firstMidName = firstMidName
    }
}

class Department {
    
    var courses:[Course] = []
    var instructors:[Instructor] = []
    
    var departmentID:Int
    var name:String
    var budget:String
    var startDate:String
    var instructorID:Int
    
    init (courses:[Course] = [], departmentID:Int, name:String, budget:String, startDate:String, instructorID:Int){
        self.courses = courses
        self.departmentID = departmentID
        self.name = name
        self.budget = budget
        self.startDate = startDate
        self.instructorID = instructorID
    }
}

class Course {
    var courseID:Int
    var title:String
    var credits:String
    var departmentID:Int
    var depto:Department
    
    init (courseID:Int, title:String, credits:String, departmentID:Int, depto:Department) {
        self.courseID = courseID
        self.title = title
        self.credits = credits
        self.departmentID = departmentID
        self.depto = depto
    }
    
    
}

class CourseAssignment {
    
    var courses:[Course]=[]
    
    var courseID:Int
    var instructorID:Int
    
    init (courseID:Int, instructorID:Int){
        self.courseID = courseID
        self.instructorID = instructorID
    }
}

class enrollment {
    
    
    var enrollmentID:Int
    var courseID:Int
    var studentID:Int
    var grade:String
    
    init (enrollmentID:Int, courseID:Int, studentID:Int, grade:String) {
        self.enrollmentID = enrollmentID
        self.courseID = courseID
        self.studentID = studentID
        self.grade = grade
    }
}
