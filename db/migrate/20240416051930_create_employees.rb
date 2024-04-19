class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :phone_number
      t.decimal :salary
      t.date :birth_date
      t.string :email
      t.string :address
      t.date :start_date
      t.boolean :active

      t.timestamps
    end
  end
end
