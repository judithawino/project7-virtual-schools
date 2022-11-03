class EducatorsController < ApplicationController
    skip_before_action :authorize

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   
    def index 
        educators = Educator.all
                    .paginate(:page => params[:page], :per_page => 5)
                    .order('created_at ASC') 
        render json: educators
    end
    
    def show
        educator = find_educator
        render json: educator
    end
    
    def create
        owner = Owner.find(decoded_token[0]["owner_id"])        
        educator = owner.educators.create!(educator_params)        
        token = encode_token(educator_id: educator.id)
        render json: { educator: EducatorSerializer.new(educator), jwt: token }, status: :created        
    end
    
    def update
        educator = find_educator
        educator.update!(educator_params)
        render json: educator
    end
    
    def destroy
        educator = find_educator
        educator.destroy
        head :no_content
    end

    private
    def find_educator
        Educator.find(params[:id])
    end
    def educator_params
        params.permit(:name, :email, :password, :school_id, :phone_contact, :owner_id)
    end
    
    def render_not_found_response
        render json: { error: "Educator not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end
