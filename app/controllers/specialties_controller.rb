class SpecialtiesController < ApplicationController
    def index
        records = Specialty.all 
        render json: records
    end

    def create
        record = Specialty.create!(recordparams)
        render json: record, status: :created
    end

    private
    def recordparams
        params.permit(:name)
    end
end
