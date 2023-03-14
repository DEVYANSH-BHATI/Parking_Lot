class Vehicle < ApplicationRecord
    # belongs_to :admin
    # belongs_to :charge
    

    #validations
    validates_uniqueness_of :number
    validates_presence_of :vehicle_type,:number,:owner
    validates :status ,:inclusion => %w[ parked left ]
    before_validation  :put_intime_and_status , on: :create

    def put_intime_and_status
        pp"put intime"
        self.in_time = DateTime.now
        # self.out_time = DateTime.now + 10.days
        self.status = 'parked'
    end
    # out tiem at press of button should trigger
    def put_out_time
        self.out_time = DateTime.now
    end

    def put_charges(min_charge,min_hours,extra_hour_charges,in_time,out_time)
        # pp min_charge,min_hours,extra_hour_charges,total_hours
        # so what we gonna do is check if total hours compares with min hours if lesser than populate self.status left , self.charge = mincharge
        # else make new var and put mincharge + totalhours-minhours*extrahours and populate self.charge with that
        total_hours = (out_time - in_time)/3600

        if total_hours < min_hours then
            self.status = 'left'
            self.charges = min_charge
            # self.out_time = DateTime.now
            self.save
        else
            total_charges = min_charge + (extra_hour_charges*(total_hours - min_hours))
            self.status = 'left'
            self.charges = total_charges
            # self.out_time = DateTime.now
            self.save
        end

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
