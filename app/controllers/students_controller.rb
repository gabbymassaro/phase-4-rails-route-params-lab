class StudentsController < ApplicationController

  def index
    if params[:name]
      students = Student.where("lower(last_name) = ?", params[:name].downcase)
      .or(Student.where("lower(first_name) = ?", params[:name].downcase))
    else
      students = Student.all
    end
    render json: students
  end

  def show
    students = Student.find(params[:id])
    render json: students
  end
end
