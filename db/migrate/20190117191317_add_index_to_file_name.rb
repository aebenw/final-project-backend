class AddIndexToFileName < ActiveRecord::Migration[5.2]
  def change
    add_index(:active_storage_blobs, :filename)
  end
end
