class Checkers

  $BLACK      = 1
  $WHITE      = 2
  $BLACK_KING = 3
  $WHITE_KING = 4
  $EMPTY      = 0
  $ROWS       = 8
  $ROWLENGTH  = 4
  $SIZE      = $ROWS * $ROWLENGTH

# The board represents only the 32 fields (8 rows of 4) where checkers pieces can be placed.
# Indexing within the board and coordinates go from 1 to 32 (therefore the array @board's size is 33).
# For a display version of the game we have to do a coordinate transformation to a full 8 by 8 board.

  def initialize
    @board = Array[]
    initializeTop
    initializeMiddle
    initializeBottom
  end

  def getBoardSize
    @board.size
  end

  def initializeTop
    # three rows of black pieces - assumes $ROWLENGTH is 4
    for i in (1..12)
      @board[i] = $BLACK
    end
  end

  def initializeMiddle
     # two rows empty
    for i in (13..20)
      @board[i] = $EMPTY
    end
  end

  def initializeBottom
    # three rows of white pieces
    for i in (21..$SIZE)
      @board[i] = $WHITE
    end
  end

  def getRow(coord)
    if coord % $ROWLENGTH == 0
      row = coord/$ROWLENGTH
    else
      row = coord/$ROWLENGTH + 1
    end
  end

  def makeMove(fromCoord, toCoord)
    if (fromCoord < 1 || fromCoord > $SIZE) || (toCoord < 1 || toCoord > $SIZE)
      return false
    end
    if isMoveValid(fromCoord, toCoord)
      @board[toCoord] = @board[fromCoord]
      @board[fromCoord] = $EMPTY
      return true
    end
    return false
  end

  def isMoveValid(fromCoord, toCoord)
    row = getRow(fromCoord)

    if @board[fromCoord] == $EMPTY
      return false
    end

    if @board[fromCoord] == $BLACK
      if row % 2 == 0
        newLeftCoord  = fromCoord + $ROWLENGTH
        newRightCoord = fromCoord + $ROWLENGTH + 1
      else
        newLeftCoord  = fromCoord + $ROWLENGTH - 1
        newRightCoord = fromCoord + $ROWLENGTH
      end

      newRow = row + 1

      if (getRow(newLeftCoord) > $ROWS) || (getRow(newRightCoord) > $ROWS)
        return false
      end
    end

    if @board[fromCoord] == $WHITE
      if row % 2 == 0
        newLeftCoord  = fromCoord - $ROWLENGTH
        newRightCoord = fromCoord - $ROWLENGTH + 1
      else
        newLeftCoord  = fromCoord - $ROWLENGTH - 1
        newRightCoord = fromCoord - $ROWLENGTH 
      end

      newRow = row - 1

      if (getRow(newLeftCoord) < 1) || (getRow(newRightCoord) < 1)
        return false
      end
    end
    
    if getRow(newRightCoord) == newRow
      if toCoord == newRightCoord
        return true
      end
    end

    if getRow(newLeftCoord) == newRow
      if toCoord == newLeftCoord
        return true
      end
    end
    return false
  end

  def printBoard
    print "\n"
    for i in (1..$SIZE)
      print @board[i]
      print " "
      if i % $ROWLENGTH == 0 # break up in rows
        print "\n"
      end
    end
    print "\n"
  end

end
