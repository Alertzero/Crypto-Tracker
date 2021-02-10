class CryptosController < ApplicationController
  def search
    if params[:crypto].present?
      @crypto = Crypto.new_lookup(params[:crypto])
      if @crypto
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid symbol to search'
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter the symbol to search'
        format.js { render partial: 'users/result' }
      end
    end
  end
end
