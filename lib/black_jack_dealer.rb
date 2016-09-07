class BlackJackDealer
  attr_reader :dealer_cards, :player_cards, :game_over, :message

  def initialize
    @deck = CardDeck.new
    @dealer_cards = {}
    @player_cards = {}
    @game_over = false
    @message = ''
    first_deal
  end

  def player_score
    player_cards.values.sum
  end

  def dealer_score
    dealer_cards.values.sum
  end

  def hit
    card = @deck.draw
    player_cards[card[0]] = card[1]
    update_game
  end

  private

  def first_deal
    2.times do
      card = @deck.draw
      player_cards[card[0]] = card[1]

      card = @deck.draw
      dealer_cards[card[0]] = card[1]
    end
    
    update_game
  end

  def update_game
    if player_score == 21
      @game_over = true
      @message = 'You have won!'
    elsif player_score > 21
      @game_over = true
      @message = 'You have lost!'
    end
  end
end
