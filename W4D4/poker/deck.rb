class Deck
  #an array of cards
  def initialize
    @cards = []
  end

  def populate
    faces = [A,1,2,3,4,5,6,7,8,9,10,J,Q,K]
    suit = [heart, spade, club, diamond]
    faces.each do |face|
      suit.each do |symbol|
        cards << Card.new(suit, face)
      end
    end
     
  end

end