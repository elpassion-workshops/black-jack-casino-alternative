class BlackJackDealer
  attr_reader :player_cards, :finished, :winner

  def initialize
    @deck = CardDeck.new
    @dealer_cards = {}
    @player_cards = {}
    @finished = false
    @winner = nil
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
    draw_for(:player)
    dealer_draw
    update_game
  end

  def stand
    while dealer_should_draw? do
      dealer_draw
    end
    update_game

    dealer_score = @dealer_cards.values.sum
    scores = {player: player_score, dealer: dealer_score}

    if player_score && dealer_score >= 21
      @winner = scores.min_by { |k,v| v }
    else
      @winner = scores.max_by { |k,v| v }
    end

    @finished = true
  end

  private

  def draw_for(subject)
    card = @deck.draw
    if subject == :player
      player_cards[card[0]] = card[1]
    else
      @dealer_cards[card[0]] = card[1]
    end
  end

  def dealer_should_draw?
    @dealer_cards.values.sum < 17
  end

  def dealer_draw
    if dealer_should_draw? && !finished
      draw_for(:dealer)
    end
  end

  def first_deal
    2.times do
      draw_for(:player)
      draw_for(:dealer)
    end
    update_game
  end

  def update_game
    if player_score == 21
      @finished = true
      @winner = [:player, player_score]
    elsif player_score > 21 || @dealer_cards.values.sum == 21
      @finished = true
      @winner = [:dealer, @dealer_cards.values.sum]
    end
  end
end
