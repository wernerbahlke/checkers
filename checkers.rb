class Checkers

  $BLACK      = "b"
  $WHITE      = "w"
  $BLACK_KING = "B"
  $WHITE_KING = "W"
  $EMPTY      = "."
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
      if @captureCoord != 0
        @board[@captureCoord] = $EMPTY
      end
      @board[toCoord] = @board[fromCoord]
      if @board[fromCoord] == $WHITE && getRow(toCoord) == 1
        @board[toCoord] = $WHITE_KING
      end
      if @board[fromCoord] == $BLACK && getRow(toCoord) == 8
        @board[toCoord] = $BLACK_KING
      end
      @board[fromCoord] = $EMPTY   
      return true
    end
    return false
  end

  def isMoveValid(fromCoord, toCoord)
    @captureCoord = 0 # Only set if we jump and capture a piece
    fromRow = getRow(fromCoord)
    toRow   = getRow(toCoord)
    if (getRow(toCoord) < 1) || (getRow(toCoord) > $ROWS)
      return false
    end

    if @board[fromCoord] == $EMPTY
      return false
    end

    if @board[toCoord] != $EMPTY
      return false
    end

    if (toRow - fromRow).abs  == 1
      oneRow = 1
      if (toCoord == moveRowsLeft(fromCoord, oneRow)) && (@board[toCoord] == $EMPTY)
        return true
      else
        if (toCoord == moveRowsRight(fromCoord, oneRow)) && (@board[toCoord] == $EMPTY)
          return true
        end
        return false
      end
    end

    if (toRow - fromRow).abs  == 2
      oneRow  = 1
      twoRows = 2

      if toCoord == moveRowsLeft(fromCoord, twoRows)
        if @board[fromCoord] != @board[moveRowsLeft(fromCoord, oneRow)]
          if @board[moveRowsLeft(fromCoord, oneRow)] != $EMPTY
            @captureCoord = moveRowsLeft(fromCoord, oneRow)
            return true
          end
        end
      end

      if toCoord == moveRowsRight(fromCoord, twoRows)
        if @board[fromCoord] != @board[moveRowsRight(fromCoord, oneRow)]
          if @board[moveRowsRight(fromCoord, oneRow)] != $EMPTY
            @captureCoord = moveRowsRight(fromCoord, oneRow)
            return true
          end
        end
      end
      return false
    end

  end

  def moveRowsLeft(fromCoord, nRows)
    if @board[fromCoord] == $BLACK
      if getRow(fromCoord) % 2 == 0
        if nRows == 1
          newLeftCoord = fromCoord + $ROWLENGTH
        else
          newLeftCoord = fromCoord + 2 * $ROWLENGTH - 1
        end
      else
        if nRows == 1
          newLeftCoord  = fromCoord + $ROWLENGTH - 1
        else
          newLeftCoord  = fromCoord + 2 * $ROWLENGTH - 1
        end
      end
    end
  
    if @board[fromCoord] == $WHITE
      if getRow(fromCoord) % 2 == 0
        if nRows == 1
          newLeftCoord  = fromCoord - $ROWLENGTH
        else
          newLeftCoord  = fromCoord - (2 * $ROWLENGTH + 1)
        end
      else
        if nRows == 1
          newLeftCoord  = fromCoord - $ROWLENGTH - 1
        else
          newLeftCoord  = fromCoord - 2 * $ROWLENGTH - 1
        end
      end
    end
    return newLeftCoord
  end

  def moveRowsRight(fromCoord, nRows)
    if @board[fromCoord] == $BLACK
      if getRow(fromCoord) % 2 == 0
        if nRows == 1
          newRightCoord  = fromCoord + $ROWLENGTH + 1
        else
          newRightCoord  = fromCoord + 2 * $ROWLENGTH + 1
        end
      else
        if nRows == 1
          newRightCoord  = fromCoord + $ROWLENGTH
        else
          newRightCoord  = fromCoord + 2 * $ROWLENGTH + 1
        end
      end
    end
  
    if @board[fromCoord] == $WHITE
      if getRow(fromCoord) % 2 == 0
        if nRows == 1
          newRightCoord  = fromCoord - $ROWLENGTH + 1
        else
          newRightCoord  = fromCoord - 2 * $ROWLENGTH + 1
        end
      else
        if nRows == 1
          newRightCoord  = fromCoord - $ROWLENGTH
        else
          newRightCoord  = fromCoord - 2 *$ROWLENGTH + 1
        end
      end
    end
    return newRightCoord
  end

  def printBoard
    print "\n"
    for i in (1..$SIZE)
      if getRow(i) % 2 == 0
        print "."
        print @board[i]
      else
        print @board[i]
        print "."
      end                
      if i % $ROWLENGTH == 0 # break up in rows
        print "\n"
      end
    end
    print "\n"
  end

end
