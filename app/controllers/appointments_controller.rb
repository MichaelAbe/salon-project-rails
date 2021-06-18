class AppointmentsController < ApplicationController
    before_action :find_appointment, only: [:show, :edit, :destroy, :update]
    before_action :find_employee, only: [:new, :create, :show, :edit, :update]
    before_action :current_user, only: [:new, :create, :edit, :update, :show]
    before_action :current_employee, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in, only: [:index, :show, :edit, :update]
    before_action :access?, only: [:show, :edit, :update]
    
    def index
        #@past_appointments = Appointment.past
        current_appointments
        past_appointments
        if !!current_employee
            @appointments = @employee.appointments 
        elsif !!current_user
            @appointments = @user.appointments
        else   
        end
    end

    def show
    end

    def new
        #byebug
        if !find_employee && !current_user  #not allowed to view the page
            redirect_to '/problem'
        elsif find_employee && !!current_user
            @appointment = @user.appointments.build
             render :new_employee_appointment
        elsif !!current_employee
            @appointment = @employee.appointments.build
            redirect_to root_path   
        else
            @appointment = Appointment.new
        end
    end

    def create 
        @appointment = @user.appointments.build(app_params)
        if @appointment.save
            #what to do if valid
            redirect_to appointments_path
        else 
            flash.now[:error] = @appointment.errors.full_messages
                render :new
        end
    end
 
    def edit
    end

    def update
        if @appointment.update(app_params)
            redirect_to appointment_path
        else
            flash.now[:error] = @appointment.errors.full_messages
            render :edit
        end
    end

    def destroy
        @appointment.destroy
        flash[:notice] = "Your appointment scheduled for #{@appointment.appointment_date} has been deleted."
        redirect_to appointments_path
    end

    def simple_calendar
    end

    private

        def find_appointment
            @appointment = Appointment.find_by_id(params[:id])
        end

        def past_appointments
            if current_user
                @past_appointments = current_user.appointments.past
            elsif current_employee
                @past_appointments = current_employee.appointments.past
            end
        end

        def current_appointments
            if current_user
                @current_appointments = Appointment.current.where(user_id: current_user.id)
            elsif   current_employee 
                @current_appointments = Appointment.current.where(employee_id: current_employee.id)
            end
        end

        def find_employee
            if params[:employee_id]
                @employee = Employee.find_by_id(params[:employee_id])
            end
        end

        def find_user
            if params[:user_id]
                @user = User.find_by_id(params[:user_id])
            end
        end

        def app_params
            params.require(:appointment).permit(:name, :appointment_date, :employee_id, :user_id)
        end

    
end



