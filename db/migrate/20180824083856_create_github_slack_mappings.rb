class CreateGithubSlackMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :github_slack_mappings do |t|
      t.string :git_username
      t.string :slack_username
      t.string :slack_userid

      t.timestamps
    end
  end
end
