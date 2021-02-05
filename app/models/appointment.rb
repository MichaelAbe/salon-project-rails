class Appointment < ApplicationRecord
    
    validates_presence_of :name, :appointment_date
    belongs_to :employee
    belongs_to :user
    accepts_nested_attributes_for :employee
    accepts_nested_attributes_for :user

    def employee_first_name
        self.employee.first_name if self.employee
    end

    def start_time
        self.appointment.appointment_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
end


