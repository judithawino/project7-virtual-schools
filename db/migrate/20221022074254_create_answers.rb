class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :answer
      t.boolean :is_plagiarised
      t.references :question, null: false, foreign_key: true
      t.string :student_id 

      t.timestamps
    end
  end
end
