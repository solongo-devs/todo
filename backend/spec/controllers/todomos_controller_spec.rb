require 'rails_helper'

RSpec.describe TodomosController, type: :controller do

  it "should respond to index" do
    get :index
    expect(response.status).to eq 200
  end

  it "should respond to index and has a title" do
    Todomo.create content: "hi", title: "heyho"
    get :index
    todomos = JSON.parse(response.body)
    expect(todomos[0]['title']).to eq "heyho"
  end

  it "should respond to index and has a content" do
    Todomo.create content: "hi", title: "heyho"
    get :index
    todomos = JSON.parse(response.body)
    expect(todomos[0]['content']).to eq "hi"
  end

  it "should respond to index and has a donw" do
    Todomo.create content: "hi", title: "heyho"
    get :index
    todomos = JSON.parse(response.body)
    expect(todomos[0]['done']).to eq false
  end

  it "should respond to index and has a title" do
    Todomo.create content: "hi", title: "heyho"
    get :index
    todomos = JSON.parse(response.body)
    expect(todomos[0]['done_time']).to eq nil
  end

  after :each do
    Todomo.destroy_all
  end

end
