class BlackJack < ApplicationRecord
  serialize :dealer, BlackJackDealer

  belongs_to :user
end
