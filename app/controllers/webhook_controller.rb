class WebhookController < ApplicationController
	include WebhookHelper
  def recieve
    @event = request.headers["X-GitHub-Event"]
    @payload = params
    return recieve_helper(@event, @payload)
  end

end
