class Vehicle < ApplicationRecord
    # belongs_to :admin
    has_many :charge
    has_one :user

    #validations
    validates_presence_of :charges_id,:number,:in_time,:out_time,:user_id



end
