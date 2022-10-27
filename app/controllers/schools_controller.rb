class SchoolsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]
    rescue_from ActiveRecord::RecordNotFound, with: :render_school_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        schools = School.all
        render json: schools, status: :ok
    end

    def show
        school = find_school
        render json: school, status: :ok
    end

    def create 
        owner = Owner.find(decoded_token[0]["owner_id"])        
        school = owner.create_school(school_params)        
        render json: school, status: :created
    end

    # def create
    #     owner = Owner.find(decoded_token[0]["owner_id"])        
    #     school = owner.school.create!(school_params)
    #     render json: school, status: :created
    # end

    def update
        owner = Owner.find(decoded_token[0]["owner_id"])
        school = find_school
        owner.school.update!(school_params)
        show
    end

    def destroy
        owner = Owner.find(decoded_token[0]["owner_id"])
        school = find_school
        owner.schools.destroy
        head :no_content
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
