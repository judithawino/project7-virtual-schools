class SessionsController < ApplicationController
    def create_session
        educator = Educator.find_by(email: params[:email])
        if educator&.authenticate(params[:password])
          session[:educator_id] = educator.id 
          render json:{ body: educator, message: "Successfully Loggedin"}, status: :ok
        else
          render json: {message: "Wrong email or Password. Please try again"}, status: :unauthorized
        end
      end    
      
      def logout
        session.delete :educator_id
        render json: {message: "Logout success"}
      end
#          //create Jwtauthentication in ruby?

# gem 'jwt'


# module JWTAuthenticatable
#   extend ActiveSupport::Concern

#   included do

#     before_action :authenticate_and_restrict_access, if: -> { %w[json csv].include? request.format }

#     rescue_from JWT::DecodeError,                   with: :invalid_token
#     rescue_from JWT::ExpiredSignature,              with: :expired_token

#     def authenticate_and_restrict_access
#       return if current_user

#       authenticate_or_request_with_http_token do |authentication_token|
#         data = JSONWebToken.decode(authentication_token)
#         sign_in User.find(data[:id]), store: false
#       end

#       authenticate_user! if !current_user and request.format == 'html'
#     end

#     def invalid_token
#       render json: { errors: 'api.invalid_token' }, status: :unauthorized
#     end

#     def expired_token
#       render json: { errors: 'api.expired_token' }, status: :unauthorized
#     end
#   end
# end





end
