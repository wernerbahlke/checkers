require './checkers'

describe Checkers do
  before :each do
    @checkers = Checkers.new
  end

  it "should initialize board" do
    @checkers.instance_eval{ initialize }
    @checkers.getBoardSize.should equal 33
  end

  it "should have initialzeTop, Middle, Bottom methods" do
    @checkers.respond_to?(:initializeTop).should be_true
    @checkers.respond_to?(:initializeMiddle).should be_true
    @checkers.respond_to?(:initializeBottom).should be_true
  end  

  it "should return the correct row" do
    @checkers.getRow(1).should equal 1
    @checkers.getRow(4).should equal 1
    @checkers.getRow(7).should equal 2
    @checkers.getRow(11).should equal 3
    @checkers.getRow(14).should equal 4
    @checkers.getRow(18).should equal 5
    @checkers.getRow(24).should equal 6
    @checkers.getRow(28).should equal 7
    @checkers.getRow(29).should equal 8
  end

  it "should return indication if move is valid" do
    @checkers.isMoveValid(1,5).should be_true
    @checkers.isMoveValid(1,4).should be_false
    @checkers.isMoveValid(13,17).should be_false
    @checkers.isMoveValid(32,29).should be_false
    @checkers.isMoveValid(32,28).should be_true
  end

  it "should make moves correctly" do
    @checkers.makeMove(1,4).should be_false
    @checkers.makeMove(13,17).should be_false
    @checkers.makeMove(1,5).should be_true
    @checkers.makeMove(29,25).should be_true
  end
 
  it "should move white piece in position one down to position 29" do
    @checkers.makeMove(1,5).should be_true
    @checkers.makeMove(5,9).should be_true
    @checkers.makeMove(9,13).should be_true
    @checkers.makeMove(13,17).should be_true
    @checkers.makeMove(17,21).should be_true
    @checkers.makeMove(21,25).should be_true
    @checkers.makeMove(25,29).should be_true
    @checkers.makeMove(29,33).should be_false
  end

  it "should move black piece in postion 32 up to position 4" do
    @checkers.makeMove(32,28).should be_true
    @checkers.makeMove(28,23).should be_true
    @checkers.makeMove(23,20).should be_true
    @checkers.makeMove(20,15).should be_true
    @checkers.makeMove(15,12).should be_true
    @checkers.makeMove(12,8).should be_true
    @checkers.makeMove(8,4).should be_true
    @checkers.makeMove(4,0).should be_false
    @checkers.makeMove(4,-2).should be_false
  end

  it "should have printBoard method" do
    @checkers.respond_to?(:printBoard).should be_true
  end

end
