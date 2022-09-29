class Patient < ApplicationRecord
    validates :age, comparison: { less_than: 18 }
end
