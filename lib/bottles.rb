class Bottles
  def initialize
  end

  def verse(number)
    if number == 0
      first_line = "No more bottles of beer on the wall, no more bottles of beer.\n"
    elsif number == 1
      first_line = "#{number} bottle of beer on the wall, #{number} bottle of beer.\n"
    else
      first_line = "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"
    end

    if number == 2
      second_line = "Take one down and pass it around, #{number - 1} bottle of beer on the wall.\n"
    elsif number == 1
      second_line = "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif number == 0
      second_line = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      second_line = "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    end

    first_line + second_line
  end

  def verses(start, final)
    final_verses = [] 
    (final..start).each do |number|
      final_verses.push(verse(number))
    end
    final_verses.reverse.join("\n")
  end

  def song
    verses(99, 0)
  end
end
