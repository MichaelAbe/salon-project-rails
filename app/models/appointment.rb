class Appointment < ApplicationRecord

    belongs_to :employee
    
    validates_presence_of :name, :appointment_date
end


