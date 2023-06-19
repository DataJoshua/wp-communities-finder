class AddColumnCommunityTypeToCommunities < ActiveRecord::Migration[7.0]
  def change
    add_column :communities, :social, :string
  end
end
