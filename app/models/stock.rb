class Stock < ApplicationRecord
  
  # Class method to lookup a stock price
  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_api[:publishable_token],
      secret_token: Rails.application.credentials.iex_api[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticker)
  end

end
