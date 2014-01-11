require 'debugger'

class BoggleBoard
  def initialize
    # Game pieces
    @letters=[["A", "A", "E", "E", "G", "N"],
              ["E", "L", "R", "T", "T", "Y"],
              ["A", "O", "O", "T", "T", "W"],
              ["A", "B", "B", "J", "O", "O"],
              ["E", "H", "R", "T", "V", "W"],
              ["C", "I", "M", "O", "T", "U"],
              ["D", "I", "S", "T", "T", "Y"],
              ["E", "I", "O", "S", "S", "T"],
              ["D", "E", "L", "R", "V", "Y"],
              ["A", "C", "H", "O", "P", "S"],
              ["H", "I", "M", "N", "Qu", "U"],
              ["E", "E", "I", "N", "S", "U"],
              ["E", "E", "G", "H", "N", "W"],
              ["A", "F", "F", "K", "P", "S"],
              ["H", "L", "N", "N", "R", "Z"],
              ["D", "E", "I", "L", "R", "X"]]

    # Letter array for dumb board generation          
    # letters = ('A'..'Z').to_a

    # Dumb boggle board generator
    # letters = ('A'..'Z').to_a
    # letter_array = Array.new(4) {letters.sample(4)}
    # p letter_array

    @initial_grid = Array.new

    @letters.each do |x|
      @initial_grid << x.sample
    end

    @grid = []
    4.times{@grid << @initial_grid.shift(4)}

    # Debug: force identical game board on each run
    @grid =  [["L", "O", "V", "E"],
              ["B", "S", "H", "R"],
              ["I", "O", "R", "S"],
              ["N", "R", "U", "E"]]
    p @grid   
  end

  def shake!
    # Resample game pieces
    @initial_grid = Array.new

    @letters.each do |x|
      @initial_grid << x.sample
    end

    @grid = []
    4.times{@grid << @initial_grid.shift(4)} 
  end
    
  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  #
  # Override this to print out a sensible board format so
  # you can write code like:
  #
  # board = BoggleBoard.new
  # board.shake!
  # puts board
  def to_s
    formatted = ""

    @grid.each do |x|
      formatted << x.join("   ") + "\n\n"
      formatted.gsub!("u\s\s\s", "u\s\s")
    end

    formatted
  end

  # Check boggle board for the presence
  # of a specific word
  def include?(word)
    result = false
    @traveled = Array.new(4,Array.new(4, 0))
    p @traveled
    # Debug: print breadcrumb grid
    @traveled.each do |x|
      print x.to_s + "\n"
    end

    puts @traveled[3][3]

    return result
  end 

end # End of class

# Driver / test code

board = BoggleBoard.new
# puts "Before shake:"
puts board
# board.shake!
# puts "After shake:"
# puts board
print "Enter a word to check: "
word = gets.chomp
puts "Checking for \"#{word}\""
p board.include?(word)

