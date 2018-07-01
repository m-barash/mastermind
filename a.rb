
class Mastermind

	def initialize(name)
		@name = name
		puts "Welcome to Mastermind, #{@name} and good luck!"
		turns_remaining #here to initialize the amount of turns, otherwise it's nill
		puts comp_choice #makes the computer choice
	end

	private
	def turns_remaining
		@turns_remaining = 3
	end

	def decrement_turn
		@turns_remaining -= 1
	end

	public
	def display_turns
		puts "You have #{@turns_remaining} turns remaining"
	end

	private
	def comp_choice 
		colors = ['black', 'white', 'red', 'blue']
		@cHash = {'a' => '', 'b' => '', 'c' => '', 'd' => ''}
		@cHash['a'] = colors[rand(4)]
		@cHash['b'] = colors[rand(4)]
		@cHash['c'] = colors[rand(4)]
		@cHash['d'] = colors[rand(4)]
		@cHash
	end

	private
	def give_feedback
		#variables are equivilant to colored peg and white peg
		color_and_position = 0
		color_only = 0
	end

	public
	def play #this works but does not yet give feedback
		while @turns_remaining > 0
			display_turns
			puts "enter your guess"
			@user_guess = gets.chomp.downcase.split(" ")
			@guessH = {'a' => '', 'b' => '', 'c' => '', 'd' => ''}
			@guessH['a'] = @user_guess[0]
			@guessH['b'] = @user_guess[1]
			@guessH['c'] = @user_guess[2]
			@guessH['d'] = @user_guess[3]
			if @guessH == @cHash
				puts "yay correct"
				break
			else
				puts "wrong buddy"
				decrement_turn
			end
		end
	end
=begin	def user_guess(a, b, c, d) #this method is obviously not complete yet
		@guess = {"a" => a, "b" => b, "c" => c, "d" => d}
		if @guess == @cHash
			puts "Holy fuck you guessed it on the first try! Congratulations!"
		else
			puts "Nah that's not right"
			decrement_turn
			display_turns	
		end
	end
=end
end

my_game = Mastermind.new("Shmulik")
my_game.play()
