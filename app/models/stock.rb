class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, presence: true
  validates :ticker, presence: true
  
  # Class method to lookup a stock price
  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_api[:publishable_token],
      secret_token: Rails.application.credentials.iex_api[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    
    begin      
      # The code bellow is equal to the above it
      # Stock.new(ticker: ticker, name: client.company(ticker).company_name, last_price: client.price(ticker))
      new(ticker: ticker, name: client.company(ticker).company_name, last_price: client.price(ticker))
    rescue => exception
      return nil
    end
  end

end
