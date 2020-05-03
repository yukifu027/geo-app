class AddPriceToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :price, :integer
  end
end
