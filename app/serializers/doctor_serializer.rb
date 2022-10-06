class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_no

  has_many :specialties
end
