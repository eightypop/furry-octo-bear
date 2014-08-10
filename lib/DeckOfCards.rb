require "DeckOfCards/version"

module DeckOfCards

  def DeckOfCards.face_cards
    [:spades, :hearts, :clubs, :diamonds].product([:ace, :king, :queen, :jack]).map do |suit, face|
      Card.new(:suit => suit, :face => face)
    end
  end

  def DeckOfCards.standard
    [:spades, :hearts, :clubs, :diamonds]
      .product([:ace, :king, :queen, :jack, :ten, :nine, :eight, :seven, :six, :five, :four, :three, :two])
      .map do |suit, face|
        Card.new(:suit => suit, :face => face)
      end
  end

  class Card

    attr_accessor :value

    # param: a hash of attributes
    def initialize(attrs)
      @value = attrs
    end

  end

  class Deck

    attr_accessor :cards

    # params: take an array of cards as a deck
    def initialize (cards = [])
      @cards = cards
    end

    #add_bottom
    # puts a card on the bottom of the deck
    def add_bottom (card)
      @cards.unshift(card);
    end

    #add_top
    # puts a card on top of the deck
    def add_top (card)
      @cards.push(card);
    end

    #draw
    # takes the top card from the deck
    def draw
      @cards.pop
    end

    #draw_random
    # pulls a card at random place in the deck
    def draw_random
      @cards.delete_at(Random.new().rand(0...@cards.count))
    end

    #insert_random
    # inserts a card into a random place in the deck
    def insert_random (card)
      @cards.insert(Random.new().rand(0...@cards.count), card)
    end

    #count
    # the number of cards in the deck
    def count
      @cards.count
    end

    #combine
    # takes the cards from another deck and puts them in this deck
    def combine (deck)
        @cards.zip(deck.cards.shift(deck.count))
    end

    #peek
    # shows the top card
    def peek
      @cards.last.value
    end

    #split
    # cuts the deck in half based on how many cards the new deck should have.
    # if there is no number specified the deck is cut in half
    def split (how_many =  self.count/2)
      Deck.new(@cards.shift(how_many))
    end

  end

end
