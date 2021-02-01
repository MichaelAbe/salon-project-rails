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
            #what to do if not valid.
        end
    end

    private

        def find_appointment
            @appointment = Appointment.find_by_id(params[:id])
        end

        def app_params
            params.require(:appointment).permit(:name, :appointment_date)
        end
end
