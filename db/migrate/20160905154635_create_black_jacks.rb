class CreateBlackJacks < ActiveRecord::Migration[5.0]
  def change
    create_table :black_jacks do |t|
      t.text :dealer

      t.timestamps
    end
  end
end
