class ChangePasswordInEducators < ActiveRecord::Migration[7.0]
  def change
    rename_column :educators, :password, :password_digest
  end
end
