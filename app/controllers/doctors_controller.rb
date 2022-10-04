class DoctorsController < ApplicationController

    def index
        doctors = Doctor.all
        render json: doctors
    end

    def create
        puts params
        doctor = Doctor.create!(docparams)
        new_record = doctor.doctorspecialties.create("specialty_id": 1)
        # new_record.save
        # byebug
        render json: doctor
    end

    private
    def docparams
        params.permit(:name, :phone_no)
    end

end
