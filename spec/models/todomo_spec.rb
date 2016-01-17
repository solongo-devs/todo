require 'rails_helper'

RSpec.describe Todomo, type: :model do
  it "should have content" do
    todomo = Todomo.new
    expect(todomo).to respond_to(:content)
  end
end
