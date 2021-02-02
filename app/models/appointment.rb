class Appointment < ApplicationRecord
    
    validates_presence_of :name, :appointment_date
    belongs_to :employee

    #accepts_nested_attributes_for :employee, reject_if: :all_blank
end


