class Specialty < ApplicationRecord
  has_many :specialty_doctors
  has_many :doctors, through: :specialty_doctors
end
