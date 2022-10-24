class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.float :percentage
      t.integer :lesson_id
      t.integer :student_id

      t.timestamps
    end
  end
end
