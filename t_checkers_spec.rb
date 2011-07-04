require './checkers'

describe Checkers do
  before :each do
    @checkers = Checkers.new
  end

  it "should initialize board" do
    @checkers.instance_eval{ initialize }
  end

  it "should have a printBoard method" do
    @checkers.instance_eval{ printBoard }
  end  

  it "should return indication if move is valid" do
    @checkers.instance_eval{ isMoveValid(1, 5) }
  end

end
