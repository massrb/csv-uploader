class AddFieldnameToCsvs < ActiveRecord::Migration[6.0]
  def change
    add_column :csvs, :status, :string
  end
end
