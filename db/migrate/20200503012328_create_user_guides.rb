class CreateUserGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :user_guides do |t|
      t.references :user, foreign_key: true
      t.references :guide, foreign_key: true
      t.timestamps
    end
  end
end
