class CreateDiscussions < ActiveRecord::Migration[7.0]
  def change
    create_table :discussions do |t|
      t.text :chat_body
      t.integer :student_id

      t.timestamps
    end
  end
end
