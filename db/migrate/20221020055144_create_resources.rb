class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.integer :educator_id
      t.string :attachment

      t.timestamps
    end
  end
end
