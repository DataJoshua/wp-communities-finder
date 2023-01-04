class AddReferenceToCommunities < ActiveRecord::Migration[7.0]
  def change
    add_reference :communities, :user, index: :true
  end
end
