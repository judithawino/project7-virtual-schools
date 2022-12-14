class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone_contact
      t.integer :school_id
      t.integer :course_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
