class QuestionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

    # GET "/questions"
    def index
        questions = Question.all
        render json: questions, status: :ok
    end

    # GET "/questions/:id"
    def show
        questions = find_question
        render json: questions, status: :ok
    end

    # POST "/questions"
    def create
        questions = Question.create!(question_params)
        render json: questions, status: :created
    end


    private
    def find_question
        Question.find(params[:id])
    end
    def question_not_found
        render json: {"error": "Not found"}, status: :not_found
    end
    def question_params
        params.permit(:question, :points, :exam_id)
    end
end
