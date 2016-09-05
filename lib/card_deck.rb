class CardDeck
  def initialize
    @cards = generate_cards
  end

  def draw
    card = @cards.to_a.sample
    @cards.delete(card[0])
    card
  end

  private

  def generate_cards
    cards = {}
    colors = ['♥', '♦', '♠', '♣']
    (2..10).to_a.each do |number|
      colors.each do |color|
        cards["#{number} #{color}"] = number
      end
    end
    ['J', 'Q', 'K'].each do |sign|
      colors.each { |color| cards["#{sign} #{color}"] = 10 }
    end
    colors.each { |color| cards["A #{color}"] = 11 }
    cards
  end
end
