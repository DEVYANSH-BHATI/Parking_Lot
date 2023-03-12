class Charge < ApplicationRecord
    # if chose to admin then render the charges view
    # has_many :vehicle

    # search
    def self.search(search)
        if search
            where("lower(vehicle_type) LIKE :search", search: "%#{search}%")
        else
            all
        end
    end

end
