class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :src, null: false
      t.integer :note_id, null: false
      t.timestamps
    end
  end
end
