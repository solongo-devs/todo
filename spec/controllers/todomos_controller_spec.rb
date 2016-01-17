require 'rails_helper'

RSpec.describe TodomosController, type: :controller do

  it "should respond to index" do
    get :index
    expect(response.status).to eq 200
  end

end
