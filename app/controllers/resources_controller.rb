class ResourcesController < ApplicationController
    def index
        resources = Resources.all
        render json: resources, status: :ok
    end

    def show
    end

    def create
    end

    def update
    end


    def destroy
    end


end
