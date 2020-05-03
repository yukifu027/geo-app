class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text  :text,          null: false
      t.integer :user_id,     null: false, foreign_key: true
      t.integer :guide_id,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
