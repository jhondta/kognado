# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are: :omniauthable
  devise :database_authenticatable, :argon2,
         :registerable, :recoverable, :rememberable,
         :validatable, :confirmable, :lockable, :timeoutable, :trackable

  # Associations
  has_one :user_profile, dependent: :destroy
end
