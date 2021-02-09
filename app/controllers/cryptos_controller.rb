class CryptosController < ApplicationController
  def search
    if params[:crypto].present?
      @crypto = Crypto.new_lookup(params[:crypto])
      if @crypto
        render 'users/my_portfolio'
      else
        flash[:alert] = 'Please enter a valid symbol to search'
        render 'users/my_portfolio'
      end
    else
      flash[:alert] = 'Please enter the symbol to search'
      redirect_to my_portfolio_path
    end
  end
end
