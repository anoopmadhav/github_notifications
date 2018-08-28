class CreateChannelUrlMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :channel_url_mappings do |t|
      t.string :channel
      t.string :url

      t.timestamps
    end
  end
end
