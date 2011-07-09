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
