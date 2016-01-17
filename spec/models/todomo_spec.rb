require 'rails_helper'
require 'timecop'

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

  describe "database interaction" do
    it "should save a todomo" do
      Todomo.create content: "Hi", title: "Hi"
      expect(Todomo.count).to equal 1
    end

    it "should save multiple todomos" do
      Todomo.create content: "Hi", title: "Hi"
      Todomo.create content: "Hi2", title: "Hi2"
      expect(Todomo.count).to equal 2
    end

    it "should update a todomo" do
        todomo = Todomo.create content: "Hi", title: "Hi"
        todomo.content = "Hi2"
        todomo.save
        todomo2 = Todomo.find(1)
        expect(todomo2.content).to eq "Hi2"
    end

    it "should update a todomo" do
        todomo = Todomo.create content: "Hi", title: "Hi"
        todomo.is_done
        todomo2 = Todomo.find(1)
        expect(todomo2.done).to be true
    end

    it "should delete a todomo" do
      Todomo.create content: "Hi", title: "Hi"
      Todomo.delete(1)
      expect(Todomo.count).to be 0
    end

    after :each do
      Todomo.destroy_all
    end
  end

  describe "mark a todomo as done" do
    it "should have a date when done" do
      todomo = Todomo.create content: "Hi", title: "Hi"
      new_time = Time.local(2016, 1, 1, 12, 0, 0)
      Timecop.freeze(new_time)
      todomo.is_done
      expect(todomo.done_time).to eq new_time
    end

    it "should be done" do
      todomo = Todomo.create content: "Hi", title: "Hi"
      todomo.is_done
      expect(todomo.done).to equal true
    end

    after :all do
      Timecop.return
    end
  end
end
