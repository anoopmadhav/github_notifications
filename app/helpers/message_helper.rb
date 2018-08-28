module MessageHelper

  CHANNEL = "github_notifications"
  ERRORS_CHANNEL = "github_notifications"

  def push_message(payload)
    repo = payload['repository']['full_name']
    pusher = GithubSlackMapping.get_slack_userid(payload['pusher']['name'])
    pusher_email = payload['pusher']['email']
    message = "#{pusher}: #{pusher_email} pushed his code to '#{repo}'"
    return CHANNEL, message
  end

  def unknown_event_message(event, log_id)
  	message = "An Unknown event '#{event}' happend. Please check the log number '#{log_id}'"
  	return ERRORS_CHANNEL, message
  end

  def pr_review_message(payload)
  	message = "*Pull request review requested* \n Service: #{payload['pull_request']['head']['repo']['name']}\n Pull request Link: #{payload['pull_request']['html_url']} \n Requested by: #{GithubSlackMapping.get_slack_userid(payload['pull_request']['user']['login'])}\n Requested: #{GithubSlackMapping.get_slack_userids(payload['pull_request']['requested_reviewers'])} "
  	return CHANNEL, message
  end

  def username_not_found_message(git_username)
  	message = "#{git_username} not found in Database"
  	return ERRORS_CHANNEL, message
  end

end
