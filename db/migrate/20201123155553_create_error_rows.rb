class CreateErrorRows < ActiveRecord::Migration[6.0]
  def change
    create_table :error_rows do |t|
      t.integer :row
      t.string :error_msg
      t.belongs_to :csv_upload
      t.timestamps
    end
  end
end
