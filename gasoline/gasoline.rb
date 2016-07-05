class GasStation
  PRICES = {
    "A95" => 1.2,
    "A92" => 1.0,
    "DIESEL" => 0.8
  }
  AVAILABLE_FUEL = PRICES.keys
  @@count = 0

  def self.count
    puts "We have #{@@count} gasoline stations"
  end

  def initialize
    @@count += 1
    puts "Hi Dude! This is the first interacrive gasoline station!\n"
    puts "============================================"
    puts "Our prices:"
    PRICES.each do |key, value|
      puts "#{key}: #{value}$"
    end
    puts "============================================"
    puts "Please write what do you need:"
    puts "Available fuel: " + AVAILABLE_FUEL.join(", ")
    puts "give_me(fuel, liters)"
    puts "full_tank(fuel)"
  end

  def give_me(fuel, liters)
    return "We haven't got such fuel, sorry!" unless aviable_fuel(fuel)
    return "Number of liters has to be more than 0!" if liters.to_i <= 0

    payment(fuel, liters)

    refill(liters)

    goodbye
  end

  def full_tank(fuel)
    return "We haven't got such fuel, sorry!" unless aviable_fuel(fuel)
    liters = rand(1..10)

    refill(liters)

    payment(fuel, liters)

    goodbye
  end

  private
    def payment(fuel, liters)
      have_to_pay = (PRICES[fuel] * liters).round(2)
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

    def refill(liters)
      puts "Start"
      i = 0
      while i <= liters
        puts i
        break if i == liters
        sleep 0.1
        puts  "."
        sleep 0.1
        puts  "."
        sleep 0.1
        puts  "."
        sleep 0.1
        i += 1
      end
      puts "Finish"
    end

    def aviable_fuel(fuel)
      AVAILABLE_FUEL.include?(fuel)
    end

    def goodbye
      puts "Have a nice day!"
    end
end