class BlackJackDealer
  attr_reader :player_cards, :game_over, :message

  def initialize
    @deck = CardDeck.new
    @dealer_cards = {}
    @player_cards = {}
    @game_over = false
    @message = ''
    2.times { hit }
  end

  def player_score
    player_cards.values.sum
  end

  def hit
    card = @deck.draw
    player_cards[card[0]] = card[1]
    update_game
  end

  private

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
