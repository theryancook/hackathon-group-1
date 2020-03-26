require 'colorize'
require 'cli/ui'
require 'ruby_figlet'
require 'io/console'
# require 'ffi'
# require 'win32/sound'
# require 'audio_player'
# Due to problems with my windows setup I was unable to get sound working.
# I was planning on having a sound play on correct and incorrect answers.
# Also a special sound to play if the user scored 0% or 100%

require_relative './qanda.rb' 

def kahoot_game()

def kahoot(no_of_questions)

	i = 0
	score = 0
	
	# The following line of code generates the question bank
	# In order to ask random questions without repeating any, an array is created the same length as the question array
	# This array contains [0, 1, 2, etc.] 
	# It is then sorted randomly, and only the first n random numbers are stored
	# Where n is the amount of questions the user has selected to answer
	q_bank = (0..Q_ARR.length-1).to_a.sort{rand() - 0.5}[0..no_of_questions-1] 

	while i < no_of_questions

		system "clear"
		current_q = q_bank[i]

		puts "Question #{i+1}:\n" 
		answer = CLI::UI::Prompt.ask(Q_ARR[current_q], options: A_ARR[current_q][1..4])

		correct_answer_index = A_ARR[current_q][0]
		correct_answer = A_ARR[current_q][correct_answer_index]
			if answer == correct_answer 
				# sound.play(correct.wav)
				score += 1
				puts "You have entered the correct answer! Your score is #{score}/#{i+1}".colorize(:green)
				puts "Press the 'enter' key to continue"
			else 
				# sound.play(incorrect.wav)
				puts "Incorrect answer :( Your score is #{score}/#{i+1}".colorize(:red)
				puts "The correct answer was '#{correct_answer}'"
				puts "Press the 'enter' key to continue"
			end
			i += 1
			pause = false

			while STDIN.getch != "\r"
			if pause == true
				puts "Press the 'enter' key to continue"
			end
			pause = !pause
			end
	end

	system "clear"

	if score == no_of_questions
		# sound.play("./celebrate.mp3")
		puts "Great work! You got all #{score} questions correct - 100%"
	elsif score > 0
		percent = ((score/no_of_questions.to_f)*100).round(2)
		puts "Game complete! You scored #{score}/#{no_of_questions} or #{percent}%"
	else
		# sound.play("./trombone.mp3")
		puts "Game complete! You got 0 correct. Better luck next time"
	end
end

play_game = true

if Q_ARR.length == A_ARR.length

	while play_game == true

		system "clear"	
		puts (RubyFiglet::Figlet.new("Welcome to Kahoot!"))
		puts ""
		print "How many questions would you like to answer? Maximum of #{Q_ARR.length} (type 'q' to quit): "
		no_of_questions = gets.chomp
		
		if no_of_questions != "q"
			no_of_questions = no_of_questions.to_i
			if no_of_questions <= Q_ARR.length && no_of_questions > 0
				kahoot(no_of_questions)
			else
				puts "Invalid selection"
				invalid = true
				sleep(1)
			end
		else
			play_game = false
			invalid = true
		end

		if invalid != true
			play_game_answer = CLI::UI::Prompt.ask("Would you like to play again?", options: %w(Yes No))
			if play_game_answer == "Yes"
				play_game = true
				system "clear"
			else
				play_game = false
			end
		else
		end
	end

	puts "See you next time :D"

else
	puts "There is an error with the Question and/or Answer bank."
	puts "Please contact customer support"
end

end