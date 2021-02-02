class Appointment < ApplicationRecord
    
    validates_presence_of :name, :appointment_date
    belongs_to :employee

    accepts_nested_attributes_for :employee, reject_if: :all_blank

    def employee_first_name
        self.employee.first_name if self.employee
    end
end


