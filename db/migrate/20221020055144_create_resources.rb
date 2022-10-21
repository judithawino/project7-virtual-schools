class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.integer :resource-id
      t.string :title
      t.integer :educator_id
      t.integer :url

      t.timestamps
    end
  end
end
