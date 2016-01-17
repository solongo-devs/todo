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
  end

  describe "database interaction" do

    it "should not save if not valid" do
      todomo = Todomo.new
      expect(todomo.save).to be false
    end

    it "should save a Todomo correctly" do
      todomo = Todomo.new content: "Hi", title: "Hi"
      todomo.save
      expect(Todomo.count).to equal 1
    end

    it "should work with multiple create" do
      Todomo.create content: "Hi", title: "Hi"
      Todomo.create content: "Hi2", title: "Hi2"
      expect(Todomo.count).to equal 2
    end

    after :each do
      Todomo.destroy_all
    end
  end
end
