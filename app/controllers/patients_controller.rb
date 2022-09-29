class PatientsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unatry
rescue_from ActiveRecord::RecordNotFound, with: :opaque

    def index
        patients = Patient.all
       if params[:name]
        patients = Patient.where("firstname = ?", params[:name]) 
        render json: patients       
       else
        render json: patients
       end
        
    end
    
    def create        
        # patient = Patient.new(patient_params)
        patient = Patient.create(patient_params)
        if patient.valid?
            # patient = Patient.create!(patient_params)
            render json: patient
        else
            render json: patient.errors
        end
    end

    def show
        patients = Patient.find(params[:id])
        render json: patients
    end


    private
    def patient_params
        params.permit(:firstname, :lastname, :doctor_id, :age, :gender)
    end

    def unatry
        render json: {error: "Wueehh, hiyo haiwezi, iko invalid"}, status: :unprocessable_entity
    end

    def opaque
        render json: {error: "Due to the opaque nature of your shambolic request, we could not get that patient. They're probably dead, check the mogue"}, status: 404
    end
    
end
