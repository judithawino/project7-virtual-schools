class OwnersController < ApplicationController
    skip_before_action :authorize, only: [:create]
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_owner_not_found_response


    def update
        owner = find_owner
        owner.update(owner_params)
        render json: owner, status: :created
    end 

    def create
        owner = Owner.create!(owner_params)
        token = encode_token(owner_id: owner.id)
        render json: { owner: OwnerSerializer.new(owner), jwt: token }, status: :created        
    end

    def index
        render json: Owner.all, status: :ok
    end

    def destroy
        owner = find_owner
        owner.destroy
        render json: {}
    end

    private

    def find_owner
        Owner.find(params[:id])
    end

    def owner_params
        params.permit(:name, :email, :password, :password_confirmation)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_owner_not_found_response
        render json: {error: 'Owner not found'}, status: :not_found
    end
end
