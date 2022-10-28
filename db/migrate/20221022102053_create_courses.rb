class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :duration
      t.integer :school_id
      t.string :image_url

      t.timestamps
    end
  end
end
