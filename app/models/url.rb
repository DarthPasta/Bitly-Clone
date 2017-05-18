class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	attr_accessor :click_count

	validates :long_url, presence: true

	def shorten
	self.short_url = "Nick/" + SecureRandom.hex(3) 
	end

end
