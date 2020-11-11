class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.string :status, null: false
      t.string :subject, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
