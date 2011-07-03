class Checkers

  def initialize
    @board = Array[32]
    for i in (0..31)
      @board[i] = i
    end
  end

  def print_board
    for i in (0..31)
      print @board[i]
      print " "
    end
    print "\n"
  end
end
