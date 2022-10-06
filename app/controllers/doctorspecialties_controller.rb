class DoctorspecialtiesController < ApplicationController

    def index
        # puts params[:doctor_id]
        records = Doctorspecialty.where('doctor_id=?', params[:doctor_id])
        render json: records
    end

    def create
        record = Doctorspecialty.new(recordparams)
        special = record.create_specialty("name": "Optician")
        # specDoc = record.create_doctor("name": "Daktari2")        
        record.save
        render json: record, status: :unprocessable_entity
    end

    private
    def recordparams
        params.permit(:doctor_id, :specialty_id)
    end
end
