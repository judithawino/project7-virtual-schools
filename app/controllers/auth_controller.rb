class AuthController < ApplicationController
    skip_before_action :authorize

    # create the owners/admin login endpoint
    def owner_login
        owner = Owner.find_by(email: login_params[:email])
        #Owner authenticate comes from BCrypt
        if owner && owner.authenticate(login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ owner_id: owner.id })
        render json: { owner: OwnerSerializer.new(owner), jwt: token }, status: :accepted
        else
        unauthorized
        end
    end

    # create the educators login endpoint
    def educator_login
        educator = Educator.find_by(email: login_params[:email])
        #Educator authenticate comes from BCrypt
        if educator && educator.authenticate(login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ educator_id: educator.id })
        render json: { educator: EducatorSerializer.new(educator), jwt: token }, status: :accepted
        else
        unauthorized
        end
    end    

    # create the students login endpoint
    def student_login
        student = Student.find_by(email: login_params[:email])
        #Student authenticate comes from BCrypt
        if student && student.authenticate(login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ student_id: student.id })
        render json: { student: StudentSerializer.new(student), jwt: token }, status: :accepted
        else
        unauthorized
        end
    end

    private
    # add the fields to be used when logging in
    def login_params
        params.permit(:email, :password)
    end

    # rendor error message when login credentials are wrong
    def unauthorized
        render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
end