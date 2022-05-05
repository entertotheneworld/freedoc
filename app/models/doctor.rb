class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :specialty_doctors
  has_many :specialties, through: :specialty_doctors
  belongs_to :city
end
