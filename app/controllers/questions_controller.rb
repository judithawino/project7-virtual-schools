class QuestionsController < ApplicationController

    # GET "/questions"
    def index
        questions = Question.all
        render json: questions, status: :ok
    end
end
