class GithubSlackMapping < ApplicationRecord

  include NotificationHelper

  def self.get_slack_userid(git_username)
    mapping = GithubSlackMapping.find_by(git_username: git_username)
    if mapping.present?
      return "<@" +mapping.slack_userid+ ">"
    else
      # binding.pry
      # username_not_found_notification(git_username)
      return "Not found user"
    end
  end

  def self.get_slack_userids(git_usernames)
  	slack_ids = ""
    git_usernames.each do |git_username|
    	slack_ids += GithubSlackMapping.get_slack_userid(git_username['login'])
    	slack_ids += ", "
    end
    return slack_ids.chomp(', ')
  end

end
