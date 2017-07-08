class RatesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @rate = @book.rates.new(rate_params)
    @rate.user = current_user
    @rate.save

    redirect_to @book
  end

  private

  def rate_params
    params.require(:rate).permit(:user, :value)
  end
end
