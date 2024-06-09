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

  # Returns the user's initials
  # Example: John Doe => JD
  def initials
    "#{first_name[0]}#{last_name[0]}"
  end

  # Returns the user's avatar.
  # If the user has an avatar, it will return the avatar.
  # If the user does not have an avatar, it will return the user's initials.
  def avatar
    if avatar.attached?
      avatar
    else
      initials
    end
  end
end
