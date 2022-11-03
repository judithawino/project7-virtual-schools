class AnswersController < ApplicationController    
rescue_from ActiveRecord::RecordNotFound, with: :render_answer_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Answer.all, status: :ok
    end
    def show
        answer = find_answer
        render json: answer, status: :ok
    end

    def create
        student = Student.find(decoded_token[0]["student_id"])
        answer = student.answers.create!(answer_params)
        render json: answer, status: :created
    end

    def update
        student = Student.find(decoded_token[0]["student_id"])
        answer = find_answer
        student.answers.update!(answer_params)
        render json: answer, status: :created
    end

    private

    def find_answer
        Answer.find(params[:id])
    end

    def answer_params
        params.permit(:answer, :question_id, :student_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_answer_not_found_response
        render json: {error: 'Answer not found'}, status: :not_found
    end

end
