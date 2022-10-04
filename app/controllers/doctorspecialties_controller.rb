class DoctorspecialtiesController < ApplicationController

    def index
        records = Doctorspecialty.all 
        render json: records
    end

    def create
        record = Doctorspecialty.create!(recordparams)
        render json: record, status: :unprocessable_entity
    end

    private
    def recordparams
        params.permit(:doctor_id, :specialty_id)
    end
end
