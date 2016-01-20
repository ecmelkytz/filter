# encoding: utf-8

class HomesController < ApplicationController
  def index
    @items = Item.all
  end
end
