require 'simplecov'
SimpleCov.start
require './card.rb'

module Flashcardinator

describe Card do

  describe '#initialize' do

    let(:acard) { Card.new(term, definition) }

    context 'valid input' do

      it 'creates a valid card' do
       acard.should be_an_instance_of(Card)
      end

    #context 'invalid input'
    end

  end

end
end
