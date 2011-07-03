require './checkers'

describe Checkers do
  before :each do
    @checkers = Checkers.new
  end

  it "should initialize board" do
    @checkers.instance_eval{ initialize }
  end

  it "should have a print_board method" do
    @checkers.instance_eval{ print_board }
  end  
end
