class StudentsController < ApplicationController  
    
    
    
    
    
    
    
    
    
    
    def index 
        render json: Student.all
    end

    def create
        students = Student.create(student_params)
        render json: students
    end

    def show
        student = Student.find_by(params[:id])
        render json: student
    end

    def update
        student = Student.find_by(params[:id])
        if student
            student.update(student_params)
            render json: student
        else
            render json: {error: "We didn't find that student"}, status: :not_found
        end
    end

    private
    def student_params
        params.permit(:name, :nickname, :hobby)
    end

end
