require "sinatra"
require "sinatra/reloader"

SECRET_NUMBER = rand(101)

get "/" do
	number = SECRET_NUMBER
	guess = params["guess"]
	message = check_guess(guess.to_i)
	erb :index, :locals => {:message => message}
end

def check_guess(guess)
	if guess > SECRET_NUMBER + 5
		"Way too high!"
	elsif guess < SECRET_NUMBER - 5
		"Way too low!"
	elsif guess > SECRET_NUMBER
		"Too high!"
	elsif  guess < SECRET_NUMBER
		"Too low!"
	elsif guess == SECRET_NUMBER
		"You got it right! The secret number is #{SECRET_NUMBER}"
	end
end

# Practice using Sinatra's set configuration
set :SECRET_NUMBER, rand(101)

get "/foo" do
	"Secret_Number is set to " + settings.SECRET_NUMBER.to_s
end