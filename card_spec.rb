require 'simplecov'
SimpleCov.start
require './card.rb'

module Flashcardinator

  describe Card do

    let (:acard) { Card.new }

    context 'During a flashcard session an instance of Card:' do

      it 'responds to .new' do
        Card.new.should be_kind_of Card
      end
      
      it 'responds to #term' do
        acard.should respond_to :term
      end

      it 'responds to #definition' do
        acard.should respond_to :definition
      end

    end

    context 'When a new card needs to be created' do

      describe '#initialize' do  
        it 'defaults @term to "sample_term" when called with no arguments' do
          acard.term.should eq("sample_term")
        end

        it 'defaults @definition to "This is a sample defintiion." for no arguments' do
          acard.definition.should eq("This is a sample defintiion.")
        end

        subject { Card.new("the_term", "the longer definition") }

        it 'sets @term to the first argument passed in' do
          subject.term.should eq("the_term")
        end

        it 'sets @definition to the second argument passed in' do
          subject.definition.should eq("the longer definition") 
        end
      end
    end


  end

end
