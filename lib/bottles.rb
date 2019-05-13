class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    bottle_number = bottle_number_for(number)
    bottle_number_successor = bottle_number_for(bottle_number.successor)

    "#{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall, " +
    "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number_successor.quantity} #{bottle_number_successor.container} of beer on the wall.\n"
  end

  private

  def bottle_number_for(number)
    case number
    when 0
      BottleNumber0.new(number)
    when 1
      BottleNumber1.new(number)
    else
      BottleNumber.new(number)
    end
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def successor
    number - 1
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def quantity
    number.to_s
  end

  def pronoun
    "one"
  end

  def container
    "bottles"
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    "no more"
  end

  def successor
    99
  end

  def action
    "Go to the store and buy some more"
  end
end

class BottleNumber1 < BottleNumber
  def pronoun
    "it"
  end

  def container
    "bottle"
  end
end
