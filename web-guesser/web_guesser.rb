require "sinatra"

get "/" do
	x = rand(101)
	"The secret number is #{x}"
end