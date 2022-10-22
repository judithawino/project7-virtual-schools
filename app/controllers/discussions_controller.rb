class DiscussionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   
    def index 
        discussions = Discussion.all 
        render json: discussions
    end
    
    def show
        discussion = find_discussion
        render json: discussion 
    end
   
    def create 
        discussion = Discussion.create!(discussion_params)
        render json: discussion
    end
   
    def update
        discussion = find_discussion
        discussion.update!(discussion_params)
        render json: discussion
    end
    
    def destroy
        discussion = find_discussion
        discussion.destroy
        head :no_content
    end
    
    private
    
    def find_discussion
        Discussion.find(params[:id])
    end
    
    def discussion_params
        params.permit(:chat_body, :student_id)
    end
   
    def render_not_found_response
        render json: { error: "Discussion not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end