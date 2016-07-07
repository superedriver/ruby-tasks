class GasStation
  @@count = 0

  def initialize
    @@count += 1
    @control = Control.new
    @payment = Payment.new

    puts "Hi Dude! This is the first interacrive gasoline station!\n"
    puts "============================================"
    puts "Our prices:"
    @payment.fuel.each do |key, value|
      puts "#{key}: #{value}$"
    end
    puts "============================================"
    puts "Please write what do you need:"
    puts "Available fuel: " + @payment.fuel.keys.join(", ")
    puts "give_me(fuel, liters)"
    puts "full_tank(fuel)"
  end

  def give_me(fuel=nil, liters=nil)
    liters = liters.to_i
    return "We haven't got such fuel, sorry!" unless has_this_fuel?(fuel)
    return "Number of liters has to be more than 0!" if liters <= 0

    @payment.pay(fuel, liters)

    @control.refill(liters)

    @control.goodbye
  end

  def full_tank(fuel="")
    return "We haven't got such fuel, sorry!" unless has_this_fuel?(fuel)
    liters = rand(1..10)

    @control.refill(liters)

    @payment.pay(fuel, liters)

    @control.goodbye
  end

  def count
    puts "We have #{@@count} gasoline stations"
  end

  private
    def has_this_fuel?(fuel)
      @payment.fuel.keys.include?(fuel.to_sym)
    end
end


class Control < GasStation
  def initialize
  end

  def refill(liters)
    puts "Start"
    i = 0
    while i <= liters
      print i
      break if i == liters
      sleep 0.1
      print  "."
      sleep 0.1
      print  "."
      sleep 0.1
      print  "."
      sleep 0.1
      i += 1
    end
    puts "\nFinish"
  end

  def goodbye
    puts "Have a nice day!"
  end
end

class Payment < GasStation
  attr_reader :fuel

  def initialize
    @fuel = {
      A95: 1.2,
      A92: 1,
      DIESEL: 0.8
    }
  end

  def pay(fuel, liters)
    have_to_pay = (@fuel[fuel.to_sym] * liters).round(2)
    puts "You have to pay #{have_to_pay}$"
    while (entered_money = (gets.chomp.to_f*100).floor/100.0) < have_to_pay
      puts "Are you kidding me?"
      puts "You have to pay #{have_to_pay}$"
    end
    if entered_money > have_to_pay
      puts "Take your change: #{(entered_money - have_to_pay).round(2)}$!"
    end
    puts "Thanks a lot!"
  end
end














