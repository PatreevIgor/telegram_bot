require 'net/http'
require 'json'

BOT_TOKEN = Rails.application.secrets.telegram_token
COMMON_REQUEST = "https://api.telegram.org/bot#{BOT_TOKEN}/".freeze
URL = 'https://arcane-savannah-59671.herokuapp.com/'.freeze
def set_webhook
  uri = URI(COMMON_REQUEST + 'setWebhook' + '?url=' + URL.to_s)
  @res = Net::HTTP.get(uri)
  p @result = JSON.parse(@res)
end

def get_me
  uri = URI(COMMON_REQEST + 'getMe/')
  @res = Net::HTTP.get(uri)
  p @result = JSON.parse(@res)
end

set_webhook
