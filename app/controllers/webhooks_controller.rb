require 'net/http'
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def callback
    @bot_token = Rails.application.secrets.telegram_token
    @response = params[:message][:text]
    @common_request = "https://api.telegram.org/bot#{@bot_token}/"
    @chat_id = params[:message][:chat][:id]
    if @response.casecmp('start').zero?
      uri = URI(@common_request + 'sendMessage' + '?chat_id=' + 
            @chat_id.to_s + '&' + 'text=' + 'hello ' + (
	    params[:message][:from][:first_name]).to_s)
      @res = Net::HTTP.post_form(uri, 'q' => '')
    end
  end
end
