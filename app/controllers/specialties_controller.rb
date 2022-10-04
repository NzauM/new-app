class SpecialtiesController < ApplicationController
    def index
        records = Specialty.all 
        render json: records
    end

    def create
        record = Specialty.create!(recordparams)
        render json: record, status: :unprocessable_entity
    end

    private
    def recordparams
        params.permit(:name)
    end
end
