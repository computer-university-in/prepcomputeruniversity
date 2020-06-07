class CreatePnjs < ActiveRecord::Migration[6.0]
  def change
    create_table :pnjs do |t|
      t.string :studentid
      t.string :q1
      t.string :q2
      t.string :score

      t.timestamps
    end
  end
end
