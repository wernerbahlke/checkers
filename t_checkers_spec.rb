require './checkers'

describe Checkers do
  before :each do
    @checkers = Checkers.new
  end

  it "should have a setup method" do
    @checkers.setup.should_not be_nil
  end  
end
