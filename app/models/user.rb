# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are: :omniauthable
  devise :database_authenticatable, :argon2,
         :registerable, :recoverable, :rememberable,
         :validatable, :confirmable, :lockable, :timeoutable, :trackable

  # Shows the full name of the user
  def full_name
    "#{first_name} #{last_name}"
  end
end
