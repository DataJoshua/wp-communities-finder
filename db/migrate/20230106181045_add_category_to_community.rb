class AddCategoryToCommunity < ActiveRecord::Migration[7.0]
  def change
    add_reference :communities, :category, foreign_key: true
  end
end
