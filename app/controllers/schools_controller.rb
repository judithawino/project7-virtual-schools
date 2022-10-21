class SchoolsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_school_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: School.all, status: :ok
    end

    def show
        school = find_school
        render json: school, status: :ok
    end

    def create
        school = School.create!(school_params)
        render json: school, status: :created

    end

    def destroy
        school = find_school
        school.destroy
        render json: {}
    end


    private
    def find_school
        School.find(params[:id])
    end

    def render_school_not_found_response
        render json: {error: 'School not found'}, status: :not_found
    end

    def school_params
        params.permit(:name, :image_url, :owner_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
