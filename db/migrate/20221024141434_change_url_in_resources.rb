class ChangeUrlInResources < ActiveRecord::Migration[7.0]
  def change
    change_column :resources, :url, :string
  end
end
