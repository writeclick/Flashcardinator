require 'simplecov'
SimpleCov.start
require './player.rb'

module Flashcardinator

  describe Player do
    
    let(:flashcardplayer) { Player.new }

    # begin w/ an "index" of likely things this class will need to do
    # update as you refactor the test & your code that results
    context 'During a flashcard session the single instance of Player:'

    it 'responds to #greet_student'
    it 'responds to #create_deck'
    it 'responds to #display_next_definition'
    it 'responds to #display_guess_prompt'
    it 'responds to #get_guess'
    it 'responds to #increment_number_of_guesses'
    it 'responds to #display_guess_status'
    it 'responds to #quit_program'

    context 'When the program begins and the user has not input any commands'

        it 'outputs a greeting to the student & prompts them to hit a key to begin'

    context 'When the user has indicated they want to begin by pressing a key'

        it 'it ensures the guess counter is set to less than the 3 allowed guesses'

        it 'shows the definition from the first card in a Deck & prompts for a guess'

    context 'When the user has provided a guess for the displayed definition'

        it 'increments a guess counter'

        it 'obtains the guess and compares it to the correct term for the definition'

    context 'When the guess provided is incorrect for the prev displayed definition'

        it 'indicates the guess was incorrect'

        it 'increments the guess counter by one'

        it 'it ensures the guess counter is set to less than the 3 allowed guesses'

        context 'When the guess counter is less than the allowed 3 total guesses'

            it 'shows the current card\'s definition'

        context 'When the guess counter is equal to max of 3 allowed guesses'

            it 'indicates the maximum number of guesses was reached'

            it 'shows the term that corresponds to the current card\'s definition'

    context 'When the guess provided is correct for the prev displayed definition'

        it 'indicates the guess was correct'

        it 'it shows the definition for the next card in the deck'

    context 'The user indicates they would like to end the game by typing "quit"'

        it 'receives the "quit" command'

        it 'displays "Session Over" to the user'
  end

end
