class ResourcesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
require 'jwt'
    
    def index
        resources = Resource.all
        render json: resources, status: :ok
    end

    def show
        resource= find_resource
        render json: resource, status: :ok
    end    

    def create 
        educator = Educator.find(decoded_token[0]["educator_id"])        
        resource = educator.resources.create!(resource_params) 
        respond_to do |format|
            if resource.save
            #   format.html { redirect_to resource, notice: 'Resource was successfully created.' }
              format.json { render :resource, status: :created, location: resource }
            else
            #   format.html { render :new }
              format.json { render json: resource.errors, status: :unprocessable_entity }
            end
          end
        end           
    end

    def update
        respond_to do |format|
        educator = Educator.find(decoded_token[0]["educator_id"])
        resource = find_resource
        if educator.resources.update!(resource_params)
            # format.html { redirect_to resource, notice: 'Recipe was successfully updated.' }
            format.json { render :show, status: :ok, location: resource }
        else
            # format.html { render :edit }
            format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end         
    end

    def destroy
        educator = Educator.find(decoded_token[0]["educator_id"])
        resource = find_resource
        educator.resources.destroy
        respond_to do |format|
            # format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
            format.json { head :no_content }        
        end
    end
    
    private


    def find_resource 
        Resource.find(params[:id])
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
