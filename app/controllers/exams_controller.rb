class ExamsController < ApplicationController
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
        exams = Exam.create!(exam_params)
        render json: exams, status: :created
    end

    def update
        exams = find_exam
        exams.update!(exam_params)
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
        params.permit(:title, :start_date, :start_time, :duration, :course_id)
    end
    def render_unprocessable_entitiy_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

end
