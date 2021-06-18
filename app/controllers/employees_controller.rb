class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :edit, :destroy, :update]
    
    
    
    def index
        @employees = Employee.all 
    end

    def show 
    end
    
    def ammount
    
       @employees = Employee.all
    end

    private 
    
    def find_employee
        @employee = Employee.find_by_id(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:username, :password, :first_name, :last_name, :bio, :picture)
    end
    


end
