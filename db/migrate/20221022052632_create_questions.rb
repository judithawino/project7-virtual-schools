class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.float :points
      t.string :exam_id
      t.string :educator_id

      t.timestamps
    end
  end
end
