class AddPictureToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :picture, :string
  end
end
