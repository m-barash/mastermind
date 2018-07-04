
class Mastermind

	def initialize(name)
		@name = name
		puts "Welcome to Mastermind, #{@name} and good luck!"
		turns_remaining #here to initialize the amount of turns, otherwise it's nill
		puts comp_choice #makes the computer choice
	end

	private
	def turns_remaining
		@turns_remaining = 12
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
		match = 0
		half_match = 0
		x = "a"
		full_match_keys = []
		half_match_keys = []
		while x < "e" 
			@guessH.each do |key,value|
				if key == x && value == @cHash[x]
					match += 1
					full_match_keys << key
				elsif key != x && value == @cHash[x] 
					if full_match_keys.include?(key) || half_match_keys.include?(key)
						next
					else
						half_match += 1
						half_match_keys << key
					end
				end
			end
			x = x.next
		end
		puts "found #{match} matches"
		puts "found #{half_match} half matches"
		p full_match_keys
		p half_match_keys
	end

	public
	def play 
		while @turns_remaining > 0
			puts "-----------------------"
			display_turns
			puts "enter your guess"
			@user_guess = gets.chomp.downcase.split(" ")
			@guessH = {'a' => '', 'b' => '', 'c' => '', 'd' => ''}
			@guessH['a'] = @user_guess[0]
			@guessH['b'] = @user_guess[1]
			@guessH['c'] = @user_guess[2]
			@guessH['d'] = @user_guess[3]
			if @guessH == @cHash
				puts "You broke the code! Congratulations!"
				break
			else
				give_feedback
				decrement_turn
			end
		end
		puts "You lost :("
		puts "The code was: #{comp_choice}"
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

=begin

h1 = {"a" => 4, "b" => 2, "c" => 3, "d" => 6}

h2 = {"a" => 4, "b" => 2, "c" => 2, "d" => 4}

x = "a"
full_match_keys = []
while x < "e" 
	h1.each do |key,value|
		if key == x && value == h2[x]
			match += 1
			full_match_keys << key
		elsif key != x && value == h2[x] 
			if full_match_keys.include?(key)
				next
			else
				half_match += 1
			end
		end
	end
	x = x.next
end
puts "found #{match} matches"
puts "found #{half_match} half matches"
p full_match_keys
=end