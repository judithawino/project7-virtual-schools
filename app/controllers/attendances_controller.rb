class AttendancesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   
    def index 
        attendance = Attendance.all
                    .paginate(:page => params[:page], :per_page => 5)
                    .order('created_at ASC') 
        render json: attendance
    end
    
    def show
        attendance = find_attendance
        render json: attendance
    end
    
    def create 
        attendance = Attendance.create!(attendance_params)
        render json: attendance
    end
    
    def update
        attendance = find_attendance
        attendance.update!(attendance_params)
        render json: attendance
    end
    
    def destroy
        attendance = find_attendance
        attendance.destroy
        head :no_content
    end

    private
    def find_attendance
        Attendance.find(params[:id])
    end
    def attendance_params
        params.permit(:percentage, :lesson_id, :student_id, :educator_id)
    end
    
    def render_not_found_response
        render json: { error: "Attendance not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
