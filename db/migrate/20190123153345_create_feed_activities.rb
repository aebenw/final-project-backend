class CreateFeedActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_activities do |t|
      t.boolean :seen, :default => false
      t.belongs_to :feed, index: true
      t.belongs_to :activity, index: true
    end

  end
end
