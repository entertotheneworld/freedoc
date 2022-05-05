require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
SpecialtyDoctor.destroy_all
Specialty.destroy_all

5.times do
  City.create(city_name: Faker::Address.city)
end

50.times do 
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
end

10.times do
  patient = Patient.all.sample
  doctor = Doctor.all.sample
  until patient.city == doctor.city 
    doctor = Doctor.all.sample
  end
  Appointment.create(doctor: doctor, patient: patient, date: Faker::Date.between(from: 1.year.ago, to: Date.today))
end

doctor_specialty = ["Allergy and immunology", "Anesthesiology", "Dermatology", "Diagnostic radiology", "Emergency medicine", "Family medicine", "Internal medicine", "Medical genetics", "Neurology"]
doctor_specialty.each {|specialty| Specialty.create(name_specialty: specialty)}

10.times do
  SpecialtyDoctor.create(doctor: Doctor.all.sample, specialty: Specialty.all.sample)
end