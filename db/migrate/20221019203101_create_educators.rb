class CreateEducators < ActiveRecord::Migration[7.0]
  def change
    create_table :educators do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :school_id
      t.string :phone_contact
      t.integer :owner_id

      t.timestamps
    end
  end
end
