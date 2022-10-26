class AuthController < ApplicationController
    skip_before_action :authorize, only: [:educator_login, :owner_login]

    def educator_login
        educator = Educator.find_by(email: login_params[:email])
        #User#authenticate comes from BCrypt
        if educator && educator.authenticate(login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ educator_id: educator.id })
        render json: { educator: EducatorSerializer.new(educator), jwt: token }, status: :accepted
        else
        unauthorized
        end
    end

    def owner_login
        owner = Owner.find_by(email: login_params[:email])
        #User#authenticate comes from BCrypt
        if owner && owner.authenticate(login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ owner_id: owner.id })
        render json: { owner: OwnerSerializer.new(owner), jwt: token }, status: :accepted
        else
        unauthorized
        end
    end

    private
    def login_params
        params.permit(:email, :password)
    end

    def unauthorized
        render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
end

# eyJhbGciOiJIUzI1NiJ9.eyJvd25lcl9pZCI6MTF9.cLBSLluxE2L6VtmKd6GaAQCPB07rF4agA0TL3eWr8zs
