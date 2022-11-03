class ExamsController < ApplicationController
  skip_before_action :authorize
    rescue_from ActiveRecord::RecordNotFound, with: :exam_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entitiy_response

    # GET "/"
    def index
        exams = Exam.all
        render json: exams, status: :ok
    end

    def show
        exams = find_exam
        render json: exams, status: :ok
    end

    def create
        owner = Owner.find(decoded_token[0]["owner_id"])
        exam = owner.exams.create!(exam_params)
        render json: exam, status: :created
    end

    def update
        owner = Owner.find(decoded_token[0]["owner_id"])
        exam = find_exam
        owner.exams.update!(exam_params)
        show
    end

    def destroy
        exams = find_exam
        exams.destroy
        head :no_content
    end

    private
    def find_exam
        Exam.find(params[:id])
    end
    def exam_not_found
        render json: {"error": "Not found"}, status: :not_found
    end
    def exam_params
        params.permit(:title, :start_date, :start_time, :duration, :course_id, :owner_id)
    end
    def render_unprocessable_entitiy_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
