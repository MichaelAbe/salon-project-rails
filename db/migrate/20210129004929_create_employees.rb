class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.text :bio

      t.timestamps
    end
  end
end
