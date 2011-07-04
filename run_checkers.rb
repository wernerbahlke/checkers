require './checkers'

checkers = Checkers.new

print "\nINVALID MOVES\n\n"

print "Move from 1 to 4:\n"

r = checkers.isMoveValid(1,4)

print "Move valid: ", r

print "\n\n"

print "Move from 13 (empty) to 17\n"

r = checkers.isMoveValid(13,17)

print "Move valid:", r

print "\n\n"

print "\nNow make some BLACK moves\n"

print "Move from 1 to 29\n"

checkers.makeMove(1,5)

checkers.makeMove(5,9)

checkers.makeMove(9,13)

checkers.makeMove(13,17)

checkers.makeMove(17,21)

checkers.makeMove(21,25)

checkers.makeMove(25,29)

checkers.makeMove(29,33)

checkers.printBoard

print "\nNow make some WHITE moves\n"

print "Move from 29 to 1\n"

checkers = Checkers.new

checkers.makeMove(29,25)

checkers.makeMove(25,21)

checkers.makeMove(21,17)

checkers.makeMove(17,13)

checkers.makeMove(13,9)

checkers.makeMove(9,5)

checkers.makeMove(5,1)

checkers.makeMove(1,-2)

checkers.printBoard

print "And now move from 30 to 3 without re-initializing the board\n"

checkers.makeMove(30,27)

checkers.makeMove(27,23)

checkers.makeMove(23,19)

checkers.makeMove(19,15)

checkers.makeMove(15,11)

checkers.makeMove(11,6)

checkers.makeMove(6,3)

checkers.printBoard

