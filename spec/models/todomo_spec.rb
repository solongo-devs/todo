require 'rails_helper'

RSpec.describe Todomo, type: :model do
  it "should have content" do
    todomo = Todomo.new
    expect(todomo).to respond_to(:content)
  end

  it "should have title" do
    todomo = Todomo.new
    expect(todomo).to respond_to(:title)
  end

  it "should have done_time" do
    expect(@todomo).to respond_to :done_time
  end
end
