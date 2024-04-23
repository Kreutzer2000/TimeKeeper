# app/models/employee.rb
class Employee < ApplicationRecord
  has_one :user  # Establece una relación uno-a-uno con User

  after_create :create_user_account

  private

  def create_user_account
    User.create(employee: self)
    unless user.persisted?
        puts "Error al crear el usuario: #{user.errors.full_messages.to_sentence}"
      end
  end
end
