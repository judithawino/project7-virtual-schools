class AddOwnerIdToExam < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :owner_id, :integer
  end
end
