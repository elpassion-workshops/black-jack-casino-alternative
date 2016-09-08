class AddUserToBlackJacks < ActiveRecord::Migration[5.0]
  def change
    add_reference :black_jacks, :user, foreign_key: true
  end
end
