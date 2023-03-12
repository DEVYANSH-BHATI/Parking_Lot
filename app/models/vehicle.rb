class Vehicle < ApplicationRecord
    # belongs_to :admin
    # belongs_to :charge
    

    #validations
    validates_uniqueness_of :number
    validates_presence_of :vehicle_type,:number,:owner
    # validates :out_time ,comparison: {greater_than: :in_time}
    validates :status ,:inclusion => %w[ parked left ]
    # valid                                      {accepted |parked,left|}
    # before_validation put intime function
    before_validation  :put_intime_and_status , on: :create

    def put_intime_and_status
        pp"put intime"
        self.in_time = DateTime.now
        # self.out_time = DateTime.now + 10.days
        self.status = 'parked'
    end
    # out tiem at press of button should trigger
    def put_out_time

    end

    def vehicle_left
        self.status = left
    end



    # search
    def self.search(search)
        if search
            where("owner ILIKE :search OR number ILIKE :search OR status ILIKE :search", search: "%#{search}%")
        else
            all
        end
    end


end
