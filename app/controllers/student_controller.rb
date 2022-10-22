class StudentController < ApplicationController
  
  def index 
    student = Student.all 
    render json: student
end

def show
    student = find_Student
    render json: student
end

def create 
    student = student.create!(student_params)
    render json: student
end

def update
    student = find_Student
    student.update!(student_params)
    render json: student
end

def destroy
    student = find_Student
    student.destroy
    head :no_content
end

private


def find_Student
    Student.find(params[:id])
end


def student_params
    params.permit(:name, :email, :password, :school_id, course_id)
end

end
