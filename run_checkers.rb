require './checkers'

checkers = Checkers.new

print "\nINVALID MOVE\n"

r = checkers.isMoveValid(1,4)

print r

print "\n"

print "\nNow make some BLACK moves\n"

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


