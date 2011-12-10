class EmployeesController < ApplicationController
  
  respond_to :json
  
  def index
    @employees = Employee.all
    
    respond_with({:employees => @employees})
  end
  
  def create
    @employee = Employee.create(params[:employee])
    
    respond_with(@employee)
  end
end