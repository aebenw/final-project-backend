class AddIndexToChannels < ActiveRecord::Migration[5.2]
  def change
    add_index(:channels, :name)
  end
end
