class BlackJackController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    redirect_to black_jack
  end

  def show
    dealer = black_jack.dealer
    @player_score = dealer.player_score
    @player_cards = dealer.player_cards
    @dealer_score = dealer.dealer_score_visible
    @dealer_cards = dealer.dealer_cards_visible
    @message = dealer.message
  end

  def hit
    black_jack.dealer.hit
    black_jack.save
    redirect_to black_jack
  end

  def stand
    black_jack.dealer.stand
    black_jack.save
    redirect_to black_jack
  end

  private

  def black_jack
    @black_jack ||= (current_user.black_jack || new_black_jack)
  end

  def new_black_jack
    BlackJack.create(dealer: BlackJackDealer.new, user: current_user)
  end
end
