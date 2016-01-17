require 'rails_helper'

RSpec.describe Todomo, type: :model do

  before :each do
    @todomo = Todomo.new
  end

  it "should have content" do
    expect(@todomo).to respond_to :content
  end

  it "should have title" do
    expect(@todomo).to respond_to :title
  end

  it "should have done" do
    expect(@todomo).to respond_to :done
  end

  it "should have done_time" do
    expect(@todomo).to respond_to :done_time
  end

  describe "validation" do
    it "should not be valid with empty content" do
      todomo = Todomo.new
      todomo.content = ""
      expect(todomo).not_to be_valid
    end

    it "should not be valid with empty title" do
      todomo = Todomo.new
      todomo.title = ""
      expect(todomo).not_to be_valid
    end

    it "should not be valid with empty done" do
      todomo = Todomo.new
      todomo.done = false
      expect(todomo).not_to be_valid
    end

    it "should not be valid with empty done_time" do
      todomo = Todomo.new
      todomo.done_time = ""
      expect(todomo).not_to be_valid
    end

  end
end
