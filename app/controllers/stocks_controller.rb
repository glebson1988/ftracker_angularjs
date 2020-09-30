# frozen_string_literal: true

class StocksController < ApplicationController
  def search
    @stock ||= Stock.new_from_lookup(params[:stock]) if params[:stock]

    if @stock
      @stock.can_be_added = current_user.can_add_stock?(@stock.ticker)
      render json: @stock, methods: [:can_be_added]
    else
      render status: 404, json: { response: 'No stocks exists for this symbol.' }
    end
  end
end
