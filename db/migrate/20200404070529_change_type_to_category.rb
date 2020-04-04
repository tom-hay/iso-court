class ChangeTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :charges, :type, :category
    rename_column :commitments, :type, :category
  end
end
