class Stock < ApplicationRecord

def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_client[:IEX_API_PUBLISHABLE_TOKEN],
        endpoint: 'https://cloud.iexapis.com/v1'
      )
    client.crypto(ticker_symbol).ask_price

    
end

    
end
