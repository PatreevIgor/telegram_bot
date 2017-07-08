require 'net/http'
require 'json'

	@bot_token = Rails.application.secrets.telegram_token
	@common_request = "https://api.telegram.org/bot#{@bot_token}/"
	@url = "https://arcane-savannah-59671.herokuapp.com/"
	def set_webhook
		uri = URI(@common_request+'setWebhook'+'?url='+"#{@url}")
		@res = Net::HTTP.get(uri)
		p @result = JSON.parse(@res)
	end
	def get_me
		uri = URI(@common_request+"getMe/")
		@res = Net::HTTP.get(uri)
		p @result = JSON.parse(@res)
	end



set_webhook


