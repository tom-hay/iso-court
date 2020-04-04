class AddUserToCharge < ActiveRecord::Migration[5.2]
  def change
    add_reference :charges, :user, foreign_key: true
  end
end
