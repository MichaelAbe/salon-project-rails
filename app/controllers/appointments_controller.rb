class AppointmentsController < ApplicationController

    before_action :find_appointment, only: [:show, :edit, :destroy, :update]

    def index 
        @appointments = Appointment.all
    end

    def show    
    end

    def new
        @appointment = Appointment.new
    end

    def create 
        @appointment = Appointment.new(app_params)
        if @appointment.save
            #what to do if valid
            redirect_to appointments_path
        else 
            #what to do if not valid
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

    private

        def find_appointment
            @appointment = Appointment.find_by_id(params[:id])
        end

        def app_params
            params.require(:appointment).permit(:name, :appointment_date)
        end
end
