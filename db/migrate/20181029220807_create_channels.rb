class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :content
      t.boolean :private

      t.timestamps
    end
  end
end
