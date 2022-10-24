class ResourcesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_resource_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        resources = Resource.all
        render json: resources, status: :ok
    end

    def show
        resource= find_resource
        render json: resource, status: :ok
    end

    def create
        resource = resource.create!(resource_params)
        render json: resource, status: :created
    end

    def update
        resource = find_resource
        resource.update!(resource_params)
        show
    end


    def destroy
        resource = find_resource
        resource.destroy
        head :no_content
    end
    
    private


    def find_resource 
        resource.find(params[:id])
    end

    def resource_params 
        params.permit(:title, :url, :educator_id)
    end

    # displaying an error message for an nonexistent resource
    def resource_not_found_response
        render json: {error: "Resource not found"}, status: :not_found
    end
    
    # displaying error for an invalid input
    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_message}, status: :unprocessable_entity
    end
end
