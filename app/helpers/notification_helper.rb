module NotificationHelper
  include MessageHelper

  def push_slack_notification(payload)
    channel, message = push_message(payload)
  	return send_slack_notification(channel, message)
  end

  def pr_review_slack_notification(payload)
  	channel, message = pr_review_message(payload)
  	return send_slack_notification(channel, message)
  end

  def unknown_slack_notification(event, log_id)
      channel, message = unknown_event_message(event, log_id)
      return send_slack_notification(channel, message)
  end

  def username_not_found_notification(git_username)
      channel, message = username_not_found_message(git_username)
      return send_slack_notification(channel, message)
  end

  def send_slack_notification(channel, message)
    url = ChannelUrlMapping.get_url(channel)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if url.starts_with?("https")
    request = Net::HTTP::Post.new(uri.request_uri)
    request.add_field('Content-Type', 'application/json')
    request.body = {
      channel: "#{channel}",
      text: "#{message}",
      username: "reinhardcustomnamebot",
      icon_emoji: ":ghost:"
    }.to_json
    response = http.request(request)
    return render :json => {:message => "Slack notification sent"}
  end

end
