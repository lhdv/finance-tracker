class Stock < ApplicationRecord
  
  # Class method to lookup a stock price
  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_api[:publishable_token],
      secret_token: Rails.application.credentials.iex_api[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    
    # The code bellow is equal to the above it
    # Stock.new(ticker: ticker, name: client.company(ticker).company_name, last_price: client.price(ticker))
    new(ticker: ticker, name: client.company(ticker).company_name, last_price: client.price(ticker))
  end

end
