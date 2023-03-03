class Charge < ApplicationRecord
    # if chose to admin then render the charges view
    belongs_to :vehicle

end
