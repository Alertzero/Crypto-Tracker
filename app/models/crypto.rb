class Crypto < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:IEX_API_PUBLISHABLE_TOKEN],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    begin
      new(ticker: ticker_symbol, name: client.crypto(ticker_symbol).symbol,
          last_price: client.crypto(ticker_symbol).ask_price)
    rescue => exception
      return nil
    end
  end
end
