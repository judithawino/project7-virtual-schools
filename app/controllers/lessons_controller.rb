class LessonsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   
    def index 
        lessons = Lesson.all 
        render json: lessons
    end
    
    def show
        lesson = find_lesson
        render json: lesson
    end
    
    def create 
        lesson = Lesson.create!(lesson_params)
        render json: lesson
    end
    
    def update
        lesson = find_lesson
        lesson.update!(lesson_params)
        render json: lesson
    end
    
    def destroy
        lesson = find_lesson
        lesson.destroy
        head :no_content
    end

    private
    def find_lesson
        Lesson.find(params[:id])
    end
    def lesson_params
        params.permit(:topic, :course_id)
    end
    
    def render_not_found_response
        render json: { error: "Lesson not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end