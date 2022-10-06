class Doctor < ApplicationRecord
    has_many :doctorspecialties, dependent: :destroy
    has_many :specialties, through: :doctorspecialties
end
