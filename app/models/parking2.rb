# same price for each hour
# ticket
# 

# Parking
#   - initialize
#   - on_entry(car)
#   - on_exit(car)
#   - status
# Car
# Ticket

class Parking
  @lots=[]
    def initialize(max_lots,hour_price)
      @max_lots=max_lots
      @hour_price=hour_price
    end
    def on_entry(car)
      if @lots.count < max_lots + 1
        @lots << car
        start_time = Time.now
        ticket = Ticket.new(start_time,car.number)
        return ticket
      end
    end
    def pay_ticket(ticket)
        current_time=Time.now
        hours_to_pay=ticket.start_time - current_time
        total_to_pay=hours_to_pay*@hour_price
        puts "please pay #{total_to_pay}"
        ticket.end_time = current_time + 15*60
    end
    def on_exit(car,ticket)
        if ticket.car_number != car.number
          put "please pay for your car"
          return false
        end
        current_time = Time.now
        if ticket.end_time = nil
          puts "you should pay for your ticket"
          return false
        end
        if ticket.end_time  < current_time 
          puts "you should pay again for your ticket"
          false
        end
        @lots.delete(car)
        return true
    end
end

class Car
  attr_reader :number
  def initialize(number,model)
    @model=model
    @number=number
  end
end

class Ticket 
  attr_accessor :end_time, :car_number
  def initialize(start_time,car_number)
      @start_time=start_time
      @car_number=car_number
      @end_time=nil
  end
end
