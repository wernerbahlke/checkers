require './checkers'

checkers = Checkers.new

r = checkers.isMoveValid(1,5)

print r

print "\n"

r = checkers.isMoveValid(1,4)

print r

print "\n"

r = checkers.isMoveValid(8, 12)

print r

print "\n"

r = checkers.isMoveValid(32, 33)

print r

print "\n"

r = checkers.isMoveValid(32, 28)

print r

print "\n"

r = checkers.isMoveValid(32, 29)

print r

print "\n"


checkers.printBoard
