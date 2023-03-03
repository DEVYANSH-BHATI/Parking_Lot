class Charge < ApplicationRecord
    # if chose to admin then render the charges view
    has_many :vehicle

end
