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


    private
    def find_question
        Question.find(params[:id])
    end
    def question_not_found
        render json: {"error": "Not found"}, status: :not_found
    end
end
