class BlackJackController < ApplicationController
  def index
  end

  def new
    black_jack_dealer = BlackJackDealer.new
    black_jack = BlackJack.create(dealer: black_jack_dealer)
    redirect_to black_jack
  end

  def show
    black_jack = BlackJack.find(params[:id])
    @score = black_jack.dealer.player_score
    @player_cards = black_jack.dealer.player_cards
    @dealer_cards = black_jack.dealer.dealer_cards
    @message = black_jack.dealer.message
  end

  def hit
    black_jack = BlackJack.find(params[:id])
    black_jack.dealer.hit
    black_jack.save
    redirect_to black_jack
  end
end
