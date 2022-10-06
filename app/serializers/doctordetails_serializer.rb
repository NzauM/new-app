class DoctordetailsSerializer < ActiveModel::Serializer
    attributes :name, :docDetails

    def docDetails
        "#{self.object.name}'s phone number is #{self.object.phone_no}"
    end
end