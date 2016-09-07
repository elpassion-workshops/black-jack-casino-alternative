class BlackJackDealer
  attr_reader :player_cards, :game_over, :message

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

  def dealer_cards_visible
    if @game_over
      @dealer_cards
    else
      @dealer_cards.take(@dealer_cards.size - 1).to_h
    end
  end

  def dealer_score_visible
    dealer_cards_visible.values.sum
  end

  def hit
    card = @deck.draw
    player_cards[card[0]] = card[1]

    dealer_draw
    update_game
  end

  private

  def first_deal
    2.times do
      card = @deck.draw
      player_cards[card[0]] = card[1]

      card = @deck.draw
      @dealer_cards[card[0]] = card[1]
    end

    update_game
  end

  def dealer_draw
    if @dealer_cards.values.sum < 17
      card = @deck.draw
      @dealer_cards[card[0]] = card[1]
    end
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
