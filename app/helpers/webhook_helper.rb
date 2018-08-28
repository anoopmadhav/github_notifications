module WebhookHelper
  include NotificationHelper

  def recieve_helper(event, payload)
    log_id = create_response_log(event, payload)
    case event
    when 'push'
      reponse = push_slack_notification(payload)
    when 'pull_request'
      reponse = pr_review_slack_notification(payload) if payload['action'] == "review_requested" or payload['action'] == "recieve"
    else
      response = unknown_slack_notification(event, log_id)
    end
    return response
  end

  def create_response_log(event, payload)
    log = Response.create(event: event, payload:payload)
    puts Response.count
    return log.id
  end
end
