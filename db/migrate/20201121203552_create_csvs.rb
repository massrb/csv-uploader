class CreateCsvs < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_uploads do |t|
      t.string :name
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
