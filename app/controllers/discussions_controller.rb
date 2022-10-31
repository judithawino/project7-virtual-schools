class DiscussionsController < ApplicationController
    skip_before_action :authorize
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   
    def index 
        discussions = Discussion.all 
        render json: discussions       
    end
    
    def show
        discussion = find_discussion
        render json: discussion, status: :ok 
    end
   
    def create 
        # student = Student.find(decoded_token[0]["student_id"])
        # discussion = student.discussions.create!(discussion_params)
        discussion = Discussion.create!(discussion_params)
        render json: discussion, status: :created
    end
   
    def update
        # student = Student.find(decoded_token[0]["student_id"])
        discussion = find_discussion
        # student.discussions.update!(discussion_params)
        discussion.update!(discussion_params)
        render json: discussion, status: :created
    end
    
    def destroy
        # student = Student.find(decoded_token[0]["student_id"])
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
