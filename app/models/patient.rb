class Patient < ApplicationRecord
    validates :age, comparison: { less_than: 18 }

    validate :doctor_retired
    # doctor_id 1 is etired, so patient shouldn't have doctor_id: 1

    def doctor_retired
        if doctor_id == 1
            errors.add(:doctor_id, "Doctor 1 is retired, try another doctor")
        end
    end
end
