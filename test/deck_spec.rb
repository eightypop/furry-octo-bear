require 'minitest/spec'
require 'minitest/autorun'
require 'DeckOfCards'

describe DeckOfCards::Card do
  it "can be created with an array of arguments" do

    card = DeckOfCards::Card.new({:face => :king, :suit => :clubs})
    card.must_be_instance_of DeckOfCards::Card
    card.value.must_equal({:face => :king, :suit => :clubs})
  end

end

describe DeckOfCards::Deck do

  it 'can be created' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck.must_be_instance_of DeckOfCards::Deck

    deck2 = DeckOfCards::Deck.new
    deck2.must_be_instance_of DeckOfCards::Deck
  end

  it 'has cards in it' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck.count.must_equal 16
  end

  it 'has a top card of ace of spades' do
    cards = DeckOfCards::face_cards
    deck = DeckOfCards::Deck.new(Array.new cards)
    deck.peek.must_equal(cards.last.value)

    deck.draw.value.must_equal(cards.last.value)
    deck.count.must_equal 15
  end

  it 'can draw a random card' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    card = deck.draw_random
    deck.count.must_equal 15
    card.must_be_instance_of DeckOfCards::Card
  end

  it 'can insert a random card' do
    deck = DeckOfCards::Deck.new(DeckOfCards::standard)
    deck.insert_random DeckOfCards::Card.new({:face => :high_joker})
    deck.count.must_equal 53

  end

  it 'can have a card added to bottom' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck.add_bottom DeckOfCards::Card.new({:face => :ace, :suit => :hearts})
    16.times { deck.draw }
    deck.draw.value.must_equal({:face => :ace, :suit => :hearts})

  end

  it 'can have a card added to the top' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck.add_top DeckOfCards::Card.new({:face => :ace, :suit => :hearts})
    deck.draw.value.must_equal({:face => :ace, :suit => :hearts})
  end

  it 'can be combined with another deck' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck2 = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck.combine deck2
    deck.count.must_equal 32
    deck2.count.must_equal 0

  end

  it 'can be combined with another deck via closure' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck2 = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    deck.combine deck2 do |cards, cards_other|
      cards.zip(cards_other).flatten.compact
    end
    deck.count.must_equal 32
    deck2.count.must_equal 0

  end

  it 'can be split into smaller decks' do
    deck = DeckOfCards::Deck.new(DeckOfCards::face_cards)
    new_deck = deck.split

    deck.count.must_equal 8
    new_deck.count.must_equal 8

    deck.split 3
    deck.count.must_equal 5

  end

end