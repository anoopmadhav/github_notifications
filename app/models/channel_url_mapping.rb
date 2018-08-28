class ChannelUrlMapping < ApplicationRecord
  def self.get_url(channel)
    return ChannelUrlMapping.find_by(channel: channel).url
  end
end
