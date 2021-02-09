class CryptosController < ApplicationController
  def search
    if params[:crypto].present?
      @crypto = Crypto.new_lookup(params[:crypto])
      if @crypto
        respond_to do |format|
        format.js { render partial: 'users/result'}
        end
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
