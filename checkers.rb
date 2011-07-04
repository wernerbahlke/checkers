class Checkers

  $BLACK = 1
  $WHITE = 2
  $EMPTY = 0
  $ROWS  = 8

# The board represents only the 32 fields where checkers pieces can be placed.
# Indexing within the board and coordinates go from 1 to 32.

  def initialize
    @board = Array[]
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

  def getRow(coord)
    if coord % 4 == 0
      row = coord/4
    else
      row = coord/4 + 1
    end
  end

  def makeMove(fromCoord, toCoord)
    if isMoveValid(fromCoord, toCoord)
      @board[toCoord] = @board[fromCoord]
      @board[fromCoord] = $EMPTY
    end
  end

  def isMoveValid(fromCoord, toCoord)
print "\nIn method\n"
    row = getRow(fromCoord)
print "from, to = "
print fromCoord
print ", "
print toCoord
print " row = "
print row
print "\n"

    if @board[fromCoord] == $BLACK
      if row % 2 == 0
        downLeftCoord  = fromCoord + 4
        downRightCoord = fromCoord + 5
      else
        downLeftCoord  = fromCoord + 3 
        downRightCoord = fromCoord + 4
      end

      newRow = row + 1

      if (getRow(downLeftCoord) > $ROWS) || (getRow(downRightCoord) > $ROWS)
        print "Out of bounds\n"
        return false
      end
    end

    if @board[fromCoord] == $WHITE
      if row % 2 == 0
        downLeftCoord  = fromCoord - 4
        downRightCoord = fromCoord - 3
      else
        downLeftCoord  = fromCoord - 5
        downRightCoord = fromCoord - 4
      end

      newRow = row - 1

      if (getRow(downLeftCoord) < 1) || (getRow(downRightCoord) < 1)
        print "Out of bounds\n"
        return false
      end
    end
print " dl = "
print downLeftCoord
print " dr = "
print downRightCoord
print "\n"
    
      if getRow(downRightCoord) == newRow
        if toCoord == downRightCoord
print "dr match\n"
          return true
        end
      else
        if getRow(downLeftCoord) == newRow
          if toCoord == downLeftCoord
print "dl match\n"
            return true
          end
        end
      end
print "no match\n"
      return false
  end

  def printBoard
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
