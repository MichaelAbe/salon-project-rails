class Appointment < ApplicationRecord

    validates_presence_of :name, :appointment_date
end


