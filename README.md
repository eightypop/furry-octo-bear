# DeckOfCards

A simple deck of cards

## Installation

Add this line to your application's Gemfile:

    gem 'DeckOfCards'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install DeckOfCards

## Usage

    require 'DeckOfCards'

### to create a deck of cards

A card is represented via a hash of attributes.

    DeckOfCards::Card.new({ :color => :blue, :type => :skip }) #uno!

To create a deck of cards, create an array of cards and pass it in.

    DeckOfCards::Deck.new([ace, king queen, ..., ten, joker, ]);

For convenience, this module has a preset standard set of cards available.

    DeckOfCards::Deck.new(DeckOfCards.standard) # contains all the hearts, clubs, spades, and diamonds (no jokers though)

To add cards to a deck

    deck.add_bottom(card) #adds a card to the bottom of the deck
    deck.add_top(card) #adds one to the top
    deck.insert_random(card) #adds one in a random place in the deck

To draw cards

    deck.draw #pulls from the top
    deck.random_draw #picks a random card from the deck

Once a card is drawn it is no longer in the deck.


You can split a deck into two decks

    new_deck = deck.split
    #and recombine them
    deck.combine(new_deck)

You can also decide how to recombine them. (Helpful if you need to shuffle)

     deck.combine deck2 do |cards, cards_other|
        cards.zip(cards_other).flatten.compact
     end


## Contributing

1. Fork it ( https://github.com/whatknight/DeckOfCards/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
