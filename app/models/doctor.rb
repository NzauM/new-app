class Doctor < ApplicationRecord
    has_many :doctorspecialties
    has_many :specialties, through: :doctorspecialties
end
