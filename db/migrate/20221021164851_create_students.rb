class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :id
      t.string :name
      t.string :email
      t.string :password
      t.string :school_id
      t.string :course_id

      t.timestamps
    end
  end
end
