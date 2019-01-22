class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.datetime :created_at, null: false
      t.integer :subject_id, null: false
      t.string :subject_type, null: false
      # In a many to many, there needs to be a
      # specified object
      t.integer :object_id
      t.string :object_type
      t.string :name, null: false
      t.boolean :checked, null: false
      t.integer :actor_id, null: false
      t.integer :receiver_id
    end

    add_index :activities, :subject_id
    add_index :activities, :subject_type
    add_index :activities, :actor_id
    add_index :activities, :receiver_id
  end
end
