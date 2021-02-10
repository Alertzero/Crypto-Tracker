class UserCryptosController < ApplicationController
  def create
    crypto = Crypto.check_db(params[:ticker])
    if crypto.blank?
      crypto = Crypto.new_lookup(params[:ticker])
      crypto.save
    end
    @user_crypto = UserCrypto.create(user: current_user, crypto: crypto)
    flash.now[:notice] = "#{crypto.name} was successfully added to your portfolio"
    redirect_to my_portfolio_path
  end

  def destroy

    crypto = Crypto.find(params[:id])
    user_crypto = UserCrypto.where(user_id: current_user.id, crypto_id: crypto.id).first
    user_crypto.destroy
    flash.now[:notice] = "#{crypto.name} was successfully removed from your portfolio"
    redirect_to my_portfolio_path
  end
end
