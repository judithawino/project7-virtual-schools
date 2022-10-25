class ApplicationController < ActionController::API
    # include ActionController::Cookies
  
  # def authorize
  #   return render json: {message: "You must log in to access this functionality"} , status: :unauthorized unless session.include? :educator_id
  # end
  # include JwtToken
  # before_action :authenticate_educator

  # private

  # def authenticate_educator
  #   header = request.headers[ 'Authorization']
  #   header = header.split(' ').last if header
  #   begin
  #     @decoded = JwtToken.decode(header)
  #     @current_educator = Educator.find(@decoded[:educator_id])
  #   rescue ActiveRecord::RecordNotFound => e
  #   render json: { errors: e.message }, status: :unauthorized
  #   rescue JWT::DecodeError => e
  #   render json: { errors: e.message }, status: :unauthorized
  #   end
  # end
  before_action :authorized

  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = Educator.find_by(id: educator_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
