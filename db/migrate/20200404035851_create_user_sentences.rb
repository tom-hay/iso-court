class CreateUserSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sentences do |t|
      t.references :user, foreign_key: true
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
