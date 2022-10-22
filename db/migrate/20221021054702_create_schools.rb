class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :image_url
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
