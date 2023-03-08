class Vehicle < ApplicationRecord
    # belongs_to :admin
    has_many :charge
    has_one :user

    #validations
    validates_presence_of :vehicle_type,:number,:in_time,:out_time,:user_id
    validates :out_time ,comparison: {greater_than: :in_time}


    # search
    def self.search(search)
        if search
            where("owner ILIKE :search OR number ILIKE :search OR status ILIKE :search", search: "%#{search}%")
        else
            all
        end
    end


end
