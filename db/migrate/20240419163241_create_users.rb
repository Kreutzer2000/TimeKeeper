class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.boolean :active, default: true
      t.string :password_digest, null: false
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
    
    # Establece índices y unicidad después de crear la tabla
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
