class DestroyUserChargesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_charges do |t|
      t.references :user, foreign_key: true
      t.references :charge, foreign_key: true
      t.timestamps
    end
  end
end
