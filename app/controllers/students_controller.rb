class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_student_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
  def index 
    student = Student.all
            .paginate(:page => params[:page], :per_page => 10)
            .order('created_at ASC') 
    render json: student, status: :ok
end

def show
    student = find_Student
    render json: student, status: :ok
end

def create 
    owner = Owner.find(decoded_token[0]["owner_id"])
    student = Student.create!(student_params)
    token = encode_token(student_id: student.id)
    render json: { student: StudentSerializer.new(student), jwt: token }, status: :created
    # render json: student, status: :created
end

def update
    student = Student.find(decoded_token[0]["student_id"])
    student = find_Student
    student.update!(student_params)
    show
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
    params.permit(:name, :email, :password, :school_id, :course_id, :owner_id)
end

def render_student_not_found_response
    render json: {error: 'Student not found'}, status: :not_foundend
end

def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
end

end