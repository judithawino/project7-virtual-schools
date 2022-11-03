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
  
    # Owner/Admin authentication
    def current_owner
      if decoded_token       
        owner_id = decoded_token[0]['owner_id']
        owner = Owner.find_by(id: owner_id)        
      end
    end
    
    # Education authentication
    def current_user
      if decoded_token
        educator_id = decoded_token[0]['educator_id']        
        educator = Educator.find_by(id: educator_id)
       end
    end   

    # student authentication
    def current_student
      if decoded_token       
        student_id = decoded_token[0]['student_id']
        student = Student.find_by(id: student_id)      
      end
    end
  
    def logged_in?
     if !!current_owner
      !!current_owner
      
     elsif !!current_user 
      !!current_user
      
     else
      !!current_student 
      
     end
      # !!current_owner
      # !!current_user
      # !!current_student      
    end
  
    def authorize
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end


  end