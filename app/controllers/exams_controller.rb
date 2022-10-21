class ExamsController < ApplicationController

    # GET "/"
    def index
        exams = Exam.all
        render json: exams, status: :ok
    end
end
