class Checkers

  $BLACK = 1
  $WHITE = 2
  $EMPTY = 0

# The board cells start at array position 0 to 31. Their coordinates are from 1 to 32.

  def initialize
    @board = Array[32]
    initializeTop
    initializeMiddle
    initializeBottom
  end

  def initializeTop
    for i in (1..12)
      @board[i - 1] = $BLACK
    end
  end

  def initializeMiddle
    for i in (13..20)
      @board[i - 1] = $EMPTY
    end
  end

  def initializeBottom
    for i in (21..32)
      @board[i - 1] = $WHITE
    end
  end

  def isMoveValid(from, to)
    
  end

  def print_board
    for i in (0..31)
      print @board[i]
      print " "
    end
    print "\n"
  end
end
