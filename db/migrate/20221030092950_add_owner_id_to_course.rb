class AddOwnerIdToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :owner_id, :integer
  end
end
