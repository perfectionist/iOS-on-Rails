class EmployeesController < ApplicationController
  
  respond_to :json
  
  def index
    @employees = Employee.all
    
    respond_with({:employees => @employees})
  end
  
  def create
    @employee = Employee.create(params[:employee])
    
    if @employee.new_record?
      render :json => @employee.errors.to_json, :status => 422
    else
      respond_with(@employee)
    end
  end
end