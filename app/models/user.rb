# app/models/user.rb
require 'securerandom'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :employee

  before_validation :generate_username_email_and_password, on: :create

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :active, inclusion: { in: [true, false] }

  attr_accessor :temporary_password  # Para acceder temporalmente a la contraseña generada

  private

  def generate_username_email_and_password
    if employee.present?
      generate_username_and_email
      self.temporary_password = SecureRandom.alphanumeric(10)
      self.password = self.temporary_password  # Devise encriptará esto automáticamente
    end
  end

  def generate_username_and_email
    # Asegurándonos de manejar correctamente cualquier forma del apellido
    first_initial = employee.first_name[0]
    last_initials = employee.last_name.split.map { |name| name[0] }.join('')
    base_username = (first_initial + last_initials).downcase
    random_number = rand(100000..999999)
    self.username = "#{base_username}#{random_number}"
    self.email = "#{username}@outlook.com"
  end

end
