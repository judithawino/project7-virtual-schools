class QuestionsController < ApplicationController    
    rescue_from ActiveRecord::RecordNotFound, with: :question_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entitiy_response

    # GET "/questions"
    def index
        questions = Question.all
                    .paginate(:page => params[:page], :per_page => 5)
                    .order('created_at ASC')
        render json: questions, status: :ok
    end

    # GET "/questions/:id"
    def show
        questions = find_question
        render json: questions, status: :ok
    end

    # POST "/questions"
    def create
        educator = Educator.find(decoded_token[0]["educator_id"])
        questions = educator.questions.create!(question_params)
        questions = Question.create!(question_params)
        render json: questions, status: :created
    end

    # PATCH "/questions/:id"
    def update
        educator = Educator.find(decoded_token[0]["educator_id"])
        questions = find_question
        questions.update!(question_params)
        show
    end

    # DELETE "/questions/:id"
    def destroy
        questions = find_question
        questions.destroy
        head :no_content
    end
 
    private
    def find_question
        Question.find(params[:id])
    end

    def question_not_found
        render json: {"error": "Not found"}, status: :not_found
    end

    def question_params
        params.permit(:question, :points, :exam_id, :educator_id)
    end
    
    def render_unprocessable_entitiy_response
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
