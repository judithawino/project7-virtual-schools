class CoursesController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   

    def index
        courses = Course.all
        render json: courses
    end

    def show
        course = find_course
        render json: course
    end

       
    def create 
        course = Course.create!(course_params)
        render json: course
    end

    def update
        course = find_course
        course.update!(course_params)
        render json: course
    end

    def destroy
        course = find_course
        course.destroy
        head :no_content
    end

    private 
    def find_course
        Course.find(params[:id])
    end

    def course_params
        params.permit(:title, :duration, :image_url, :school_id)
    end

    def render_not_found_response
        render json: { error: "Course not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
