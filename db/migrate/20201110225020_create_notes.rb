class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.integer :user_id
      t.string :status
      t.string :subject
      t.text :text
      t.timestamps
    end
  end
end
