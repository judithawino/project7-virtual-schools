class ExamsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :exam_not_found

    # GET "/"
    def index
        exams = Exam.all
        render json: exams, status: :ok
    end

    def show
        exams = find_exam
        render json: exams, status: :ok
    end

    private
    def find_exam
        Exam.find(params[:id])
    end
    def exam_not_found
        render json: {"error": "Not found"}, status: :not_found
    end
end
