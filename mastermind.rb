
class Mastermind

	def initialize(name)
		@name = name
		puts "Welcome to Mastermind, #{@name} and good luck!"
		turns_remaining 
		comp_choice 
	end

	private # Stores the amount of turns player has remaining, default value is 12
	def turns_remaining
		@turns_remaining = 12
	end

	def decrement_turn # Decrements the turns amount by 1, called after incorrect guess
		@turns_remaining -= 1
	end

	public # Displays the turns player has left, called at beginning of each turn
	def display_turns
		puts "You have #{@turns_remaining} turns remaining"
	end

	private
	def comp_choice # Computer randomly chooses 4 colors, stores choice in a hash
		colors = ['black', 'white', 'red', 'blue']
		@cHash = {'a' => '', 'b' => '', 'c' => '', 'd' => ''}
		@cHash['a'] = colors[rand(4)]
		@cHash['b'] = colors[rand(4)]
		@cHash['c'] = colors[rand(4)]
		@cHash['d'] = colors[rand(4)]
		@cHash
	end

	private
	def victory # Stores the victory condition value, default is false
		@victory = false
	end

	private
	def give_feedback # Calculates full matches (color and position) and half matches (color only)
		full_match_index = []
		half_match_index = {}
		x = "a"
		while x < "e" 
			@guessH.each do |key,value|
				if key == x && value == @cHash[x]
					full_match_index << key
					if half_match_index.has_value?(key)
						half_match_index.delete_if {|k, v| v == key}
					end 
				elsif key != x && value == @cHash[x] 
					if  half_match_index.has_value?(key) || full_match_index.include?(key)# REMEMBER ME
						next
					else
						half_match_index[x] = key
					end
				end
			end
			x = x.next
		end
		match = full_match_index.length
		half_match = half_match_index.length
		puts ""
		puts "found #{match} matches at #{full_match_index}"
		puts "found #{half_match} half matches at #{half_match_index}"
	end

	public
	def play # Gets user input, checks for full match, displays the correct response 
		while @turns_remaining > 0
			puts "---------------------------------------"
			display_turns
			puts "enter your guess"
			@user_guess = gets.chomp.downcase.split(" ")
			@guessH = {'a' => '', 'b' => '', 'c' => '', 'd' => ''}
			@guessH['a'] = @user_guess[0]
			@guessH['b'] = @user_guess[1]
			@guessH['c'] = @user_guess[2]
			@guessH['d'] = @user_guess[3]
			if @guessH == @cHash
				@victory = true
				break
			else
				give_feedback
				decrement_turn
			end
		end
		if @victory == true
			puts "Congratulations you broke the code!"
		else
			puts "You lost :("
		end
		
		puts "The code was: #{@cHash}"
	end
end

my_game = Mastermind.new("Shmulik")
my_game.play()