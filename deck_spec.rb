require 'simplecov'
SimpleCov.start
require './deck.rb'

module Flashcardinator

  describe Deck do
    
    let(:thedeck) { Deck.new }

    context 'During a flashcard session, an instance of Deck:' do

      it 'responds to #add_card' do
        thedeck.should respond_to(:add_card)
      end

      it 'responds to #cards' do
        thedeck.should respond_to(:cards)
      end

      it 'responds to #update_card_terms_by_created_at' do
        thedeck.should respond_to(:card_terms_by_created_at)
      end

      it 'responds to #deserialize_flashcards_data_dot_txt!' do
        thedeck.should respond_to(:deserialize_flashcards_data_dot_txt!)
      end
    end

    context 'When the program begins and no decks exist yet' do

      describe '#initialize' do
        it 'creates a deck w/ one card for each line from "flashcards_data.txt"' do
          count = %x{ wc -l "./flashcards_data.txt"}.split.first.to_i
          thedeck.cards.should have_exactly(count).items
        end
      end

      context 'Unless the file "flashcards_data.txt" does not exist, in which case' do

        before { File.rename("./flashcards_data.txt", "./test-flashcards_data.txt") }
        describe '#deserialize_flashcards_data_dot_txt!' do
          it 'raises an error message' do
            expect do
              thedeck.deserialize_flashcards_data_dot_txt! 
            end.to raise_error(Errno::ENOENT)
          end
          after { File.rename("./test-flashcards_data.txt", "./flashcards_data.txt") }
        end
      end

      context 'Or unless the file data file is not a list of terms & defs, then ' do
        
        before do
          File.rename("./flashcards_data.txt", "./orig-flashcards_data.txt")
          broken_data_file = File.new("./flashcards_data.txt", "w+")
          IO.write("./flashcards_data.txt", "A term longer than \ta definition.")
        end
        describe '#deserialized_flashcards_data_dot_txt!' do
          it 'raises an error message indicating incorrect data in the file' do 
            thedeck.deserialize_flashcards_data_dot_txt!.should raise_error("bad data file")
          end
        end
        after do
          File.delete("./flashcards_data.txt")
          File.rename("./orig-flashcards_data.txt", "./flashcards_data.txt")
        end
      end
    end


    context 'Right after a deck contains generated cards' do

      describe '#card_terms_by_created_at' do
        it 'knows the sequence of all the cards that have been generated' do
          term = File.readlines('flashcards_data.txt').first.split("\t").first
          thedeck.card_terms_by_created_at.should have_at_least(term).term
        end
      end
    end

    #context 'If new cards are created *after* the deck has first been created' do

      #describe '#update_card_terms_by_created_at' do
        #it 'adds the term assoc w/ a/the card(s) to list of card terms by created at' do
          #last_term = thedeck.card_terms_by_created_at.last
          #thedeck.update_card_terms_by_created_at!("new_term", "another_term")
          #thedeck.card_terms_by_created_at.last.should_not eq(last_term)
        #end
        #after { 2.times { thedeck.card_terms_by_created_at.pop } }
      #end
    #end

  end

end
