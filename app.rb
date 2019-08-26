#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = 'Something wrong!'
	erb :about
end

post '/visit' do
	@name = params[:name]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	# хеш
	hh = {:name => 'Enter name', 
		    :phone => 'Enter phone', 
		    :datetime => 'Enter date and time'
		  }

	#для кожної пари ключ-значення
	hh.each do |key, value|		
	# якщо параметр порожній
		if params[key] == ''			
		# змінній @error присвоюємо value з хеша hh 
		# (це значення - повідомлення про помилку)
		# тобто змінній @error присвоїти повідомлення про помилку
			@error = hh[key]	
		# повернути view visit		
			return erb :visit
		end
	end



	# if @name == ''
	# 	@error = 'Enter name'
	# 	return erb :visit
	# end


	# if @phone == ''
	# 	@error = 'Enter phone'
	# 	return erb :visit
	# end

	# if @datetime == ''
	# 	@error = 'Enter date and time'
	# 	return erb :visit
	# end

	# if @error != ''
	# 		return erb :visit
	# end


	# @message = "Dear #{@name}, we are glad that You are with us"

	f = File.open "./public/user.txt", "a"
	f.write "User: #{@name} Phone: #{@phone} Data and time: #{@datetime} Your barber will be: #{@barber} Your color: #{@color}"

	erb :visit


end

get '/visit' do
	erb :visit
end

post '/contacts' do
	@email = params[:email]
	@message = params[:message]

	# @message = "Dear #{@name}, we are glad that You are with us"

	f = File.open "./public/contacts.txt", "a"
	f.write "Mail: #{@email} Message: #{@message} "

	erb :contacts


end

get '/contacts' do
	erb :contacts
end

