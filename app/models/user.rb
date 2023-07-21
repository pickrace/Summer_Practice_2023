class User < ApplicationRecord
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :salary, presence:true
  # validates :dob, presence:true
end
