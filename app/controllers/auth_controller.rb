class AuthController < ApplicationController
    skip_before_action :authorize, only: [:login]

    def login
        educator = Educator.find_by(email: educator_login_params[:email])
        #User#authenticate comes from BCrypt
        if educator && educator.authenticate(educator_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ educator_id: educator.id })
        render json: { educator: EducatorSerializer.new(educator), jwt: token }, status: :accepted
        else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end
    private
    def educator_login_params
        params.permit(:email, :password)
    end
end
