class TodomosController < ApplicationController
  def index
    todomos = Todomo.all
    render json: todomos
  end
end
