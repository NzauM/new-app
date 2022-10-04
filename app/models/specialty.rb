class Specialty < ApplicationRecord
    has_many :doctorspecialties
    has_many :doctors, through: :doctorspecialties
end
