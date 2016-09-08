class BlackJackDealer
  attr_reader :player_cards, :finished, :message

  def initialize
    @deck = CardDeck.new
    @dealer_cards = {}
    @player_cards = {}
    @finished = false
    @message = ''
    first_deal
  end

  def player_score
    player_cards.values.sum
  end

  def dealer_cards_visible
    if @finished
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

  def stand
    @finished = true
    dealer_draw
    dealer_draw

    update_game

    dealer_score = @dealer_cards.values.sum
    scores = {player: player_score, dealer: dealer_score}

    if player_score && dealer_score >= 21
      winner = scores.min_by { |k,v| v }
    else
      winner = scores.max_by { |k,v| v }
    end

    @message = "#{winner[0]} is the winner"
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
    if @dealer_cards.values.sum < 17 && !finished
      card = @deck.draw
      @dealer_cards[card[0]] = card[1]
    end
  end

  def update_game
    if player_score == 21
      @finished = true
      @message = 'You have won!'
    elsif player_score > 21
      @finished = true
      @message = 'You have lost!'
    end

    if @dealer_cards.values.sum == 21
      @finished = true
      @message = 'You have lost!'
    end
  end
end
