require 'rails_helper'

RSpec.describe Todomo, type: :model do

  before :each do
    @todomo = Todomo.new
  end

  it "should have content" do
    expect(@todomo).to respond_to(:content)
  end

  it "should have title" do
    expect(@todomo).to respond_to(:title)
  end

  it "should have done" do
    expect(@todomo).to respond_to(:done)
  end
end
