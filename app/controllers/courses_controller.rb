class CoursesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   

    def index
        courses = Course.all
                    .paginate(:page => params[:page], :per_page => 5)
                    .order('created_at ASC')
        render json: courses
    end

    def show
        course = find_course
        render json: course
    end

       
    def create 
        owner = Owner.find(decoded_token[0]["owner_id"])
        course = owner.courses.create!(course_params)
        render json: course
    end

    def update
        owner = Owner.find(decoded_token[0]["owner_id"])
        course = find_course
        owner.courses.update!(course_params)
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
        params.permit(:title, :duration, :image_url, :school_id, :owner_id)
    end

    def render_not_found_response
        render json: { error: "Course not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
