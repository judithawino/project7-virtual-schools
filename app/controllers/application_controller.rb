class ApplicationController < ActionController::API
    before_action :authorize
  
    def encode_token(payload)
      JWT.encode(payload, 'virtuals3cret')
    end
  
    def decoded_token
      if auth_header
        token=auth_header.split(" ").last
        begin
          JWT.decode(token, 'virtuals3cret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
    def auth_header
        request.headers['Authorization']
    end
  
    def current_user
      if decoded_token
        educator_id = decoded_token[0]['educator_id']        
        educator = Educator.find_by(id: educator_id)

        # # owner authentication
        # owner_id = decoded_token[0]['owner_id']
        # owner = Owner.find_by(id: owner_id)

        # # student authentication
        # student_id = decoded_token[0]['student_id']
        # student = Student.find_by(id: student_id)
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorize
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  end