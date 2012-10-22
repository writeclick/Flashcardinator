require 'simplecov'
SimpleCov.start
require './card.rb'

module Flashcardinator

  describe Card do

    let (:acard) { Card.new }

    it 'responds to #term' do
      acard.should respond_to :term
    end

    it 'responds to #definition' do
      acard.should respond_to :definition
    end

    describe '#initialize' do
      context 'after calling Card.new to generate a new card' do
        it 'is a valid card' do
          acard.should be_kind_of Card
        end
        it 'defaults @term to "sample_term"' do
          acard.term.should eq("sample_term")
        end
      end
    end


  end

end
