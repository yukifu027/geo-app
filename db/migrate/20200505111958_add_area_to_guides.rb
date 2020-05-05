class AddAreaToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :area, :string
  end
end
