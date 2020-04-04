class CreateUserCommitments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_commitments do |t|
      t.references :user, foreign_key: true
      t.references :commitment, foreign_key: true

      t.timestamps
    end
  end
end
