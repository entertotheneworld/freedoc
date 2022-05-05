class RemoveColumnZipCode < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :zip_code, :string
  end
end
