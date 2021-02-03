class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :edit, :destroy, :update]
    
    
    
    def index
        @employees = Employee.all 
    end

    def show 
    end
    
    private 
    
    def find_employee
        @employee = Employee.find_by_id(params[:id])
    end

end



