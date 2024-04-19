class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :employee, null: false, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
