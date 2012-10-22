module Flashcardinator
  class Card
    attr_accessor :term, :definition

    def initialize(term = "sample_term", definition = "This is a sample defintiion.")
      @term = term
      @definition = definition
    end
  end
end
