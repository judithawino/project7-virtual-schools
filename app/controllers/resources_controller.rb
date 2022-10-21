class ResourcesController < ApplicationController
    
    
    def index
        resources = Resources.all
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
        render json: resource, status: :ok
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
        params.permit(:description, :educator_id, :student_id)
    end


end
