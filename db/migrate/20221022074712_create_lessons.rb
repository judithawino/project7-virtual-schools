class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :topic
      t.integer :educator_id
      t.integer :course_id

      t.timestamps
    end
  end
end
