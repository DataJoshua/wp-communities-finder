class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :nickname
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
