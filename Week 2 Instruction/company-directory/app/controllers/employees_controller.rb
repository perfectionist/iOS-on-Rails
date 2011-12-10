class EmployeesController < ApplicationController
  
  respond_to :json
  
  def index
    @employees = Employee.all
    
    respond_with({:employees => @employees})
  end
end