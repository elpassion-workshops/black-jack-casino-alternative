class BlackJack < ApplicationRecord
  serialize :dealer, BlackJackDealer
end
