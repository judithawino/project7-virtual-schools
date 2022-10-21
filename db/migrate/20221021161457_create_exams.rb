class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :title
      t.datetime :start_time
      t.integer :duration
      t.integer :course_id

      t.timestamps
    end
  end
end
