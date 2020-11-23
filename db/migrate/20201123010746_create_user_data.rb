class CreateUserData < ActiveRecord::Migration[6.0]
  def change
    create_table :user_data do |t|
      t.belongs_to :csv_upload
      t.string :first
      t.string :last
      t.string :email
      t.string :phone
      t.integer :row

      t.timestamps
    end
  end
end
