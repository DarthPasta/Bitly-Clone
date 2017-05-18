require 'byebug'

get '/' do
@urls = Url.all

  erb :"static/index"
end

get '/about_me' do
  erb :"static/about_me"
end

post '/receive' do 
	@urls = Url.all

	x = Url.new
	x.long_url = params[:long_url]
	x.shorten

	if x.save
		@url = x
		{
			long_url: @url.long_url,
			short_url: @url.short_url,
			click_count: @url.click_count
		}.to_json #can copy to terminal, get link
	else
		@urle = x
	end

  	# erb :"static/index"
end

get '/Nick/:short_url' do 
	
	url = Url.find_by(short_url: 'Nick/' + params[:short_url])
	url.click_count ||= 0
	url.click_count += 1
	url.save

	redirect url.long_url

end
