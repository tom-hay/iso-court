class AddChargeToSentence < ActiveRecord::Migration[5.2]
  def change
    add_reference :sentences, :charge, foreign_key: true
  end
end
