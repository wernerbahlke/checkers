class Checkers

  $BLACK = 1
  $WHITE = 2
  $EMPTY = 0

# The board represents only the 32 fields where checkers pieces can be placed.
# Indexing within the board and the coordinates used go from 1 to 32.

  def initialize
    @board = Array[33] # one larger so we can index from 1 to 32
    initializeTop
    initializeMiddle
    initializeBottom
  end

  def initializeTop
    for i in (1..12)
      @board[i] = $BLACK
    end
  end

  def initializeMiddle
    for i in (13..20)
      @board[i] = $EMPTY
    end
  end

  def initializeBottom
    for i in (21..32)
      @board[i] = $WHITE
    end
  end

  def isMoveValid(from, to)
    
  end

  def print_board
    print "\n"
    for i in (1..32)
      print @board[i]
      print " "
      if i % 4 == 0 # break up in rows
        print "\n"
      end
    end
    print "\n"
  end
end
