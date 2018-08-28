class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string :event
      t.jsonb :payload

      t.timestamps
    end
  end
end
