module Flashcardinator
require './card.rb'

  class Deck
    attr_accessor :cards
    attr_reader :card_terms_by_created_at

    def initialize
      @cards = {}
      @card_terms_by_created_at = []
      deserialize_flashcards_data_dot_txt!

    end

    def deserialize_flashcards_data_dot_txt!
      File.readlines('flashcards_data.txt').each do |line|
        a_card = Card.new( *line.split("\t") )
        @cards[a_card.term] = a_card.definition
        @card_terms_by_created_at << a_card.term
      end
      return @cards
    end

    def add_card
      flashcard = Card.new
    end

    def update_card_terms_by_created_at!(*terms)
      terms.each do |term|
        @card_terms_by_created_at << term
      end
    end

   # def update_deck_meta(terms=[])
      #update_card_terms_by_created_at(terms) unless terms.first == nil
    #end
  end

end
