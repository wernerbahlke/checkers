require './checkers'

print "Move black and white pieces\n\n"

checkers = Checkers.new

print "Black 9 to 13"

checkers.makeMove(9,13)

checkers.printBoard

print "White 22 to 18"

checkers.makeMove(22,18)

checkers.printBoard

print "Black 13 to 22, takes 18"

checkers.makeMove(13,22)

checkers.printBoard

print "White 27 to 18, takes 22"

checkers.makeMove(27,18)

checkers.printBoard

print "White 18 to 13"

checkers.makeMove(18,13)

checkers.printBoard

print "Black 10 to 17, takes 13"

checkers.makeMove(10,17)

checkers.printBoard

print "White 21 to 18"

checkers.makeMove(21,18)

checkers.printBoard

print "White 26 to 22"

checkers.makeMove(26,22)

checkers.printBoard

print "White 30 to 27"

checkers.makeMove(30,27)

checkers.printBoard

print "Black 17 to 21"

checkers.makeMove(17,21)

checkers.printBoard

print "Black 21 to 26"

checkers.makeMove(21,26)

checkers.printBoard

print "Black 26 to 30, should be KING"

checkers.makeMove(26,30)

checkers.printBoard

print "White 18 to 13"

checkers.makeMove(18,13)

checkers.printBoard

print "White 13 to 9"

checkers.makeMove(13,9)

checkers.printBoard

print "Black 5 to 10"

checkers.makeMove(5,10)

checkers.printBoard

print "Black 10 to 14"

checkers.makeMove(10,14)

checkers.printBoard

print "Black 2 to 5"

checkers.makeMove(2,5)

checkers.printBoard

print "White 9 to 2, takes 5 and turns King"

checkers.makeMove(9,2)

checkers.printBoard
