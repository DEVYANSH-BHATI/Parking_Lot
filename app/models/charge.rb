class Charge < ApplicationRecord
    # if chose to admin then render the charges view
    # has_many :vehicle

    validates_presence_of :vehicle_type,:min_charge,:min_hours,:extra_hour_charges
    validates :vehicle_type ,uniqueness: { case_sensitive: false, message: " already exist, go to edit page to make changes to existing vehicles"}




    # search
    def self.search(search)
        if search
            where("lower(vehicle_type) LIKE :search", search: "%#{search}%")
        else
            all
        end
    end

end
