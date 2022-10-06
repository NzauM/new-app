class DoctorsController < ApplicationController

    def index
        doctors = Doctor.all
        render json: doctors, each_serializer: DoctordetailsSerializer
    end

    def create
        puts params
        doctor = Doctor.create!(docparams)
        # params[:specializations].each do |spec|
        #     speciality = Specialty.find_or_create_by(name: spec)
        #     newdocSpec = doctor.doctorspecialties.create("specialty_id": speciality.id)   
        # end 
        
        render json: doctor
    end

    private
    def docparams
        params.permit(:name, :phone_no)
    end

end
