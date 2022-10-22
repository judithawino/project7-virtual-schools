class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :school_id
      t.integer :course_id

      t.timestamps
    end
  end
end
