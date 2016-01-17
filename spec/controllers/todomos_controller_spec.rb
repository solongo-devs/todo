require 'rails_helper'

RSpec.describe TodomosController, type: :controller do

  it "should respond to index" do
    get :index
    expect(response.status).to eq 200
  end

  it "should respond to index" do
    Todomo.create content: "hi", title: "heyho"
    get :index
    todomos = JSON.parse(response.body)
    expect(todomos[0]['title']).to eq "heyho"
  end

  after :each do
    Todomo.destroy_all
  end

end
