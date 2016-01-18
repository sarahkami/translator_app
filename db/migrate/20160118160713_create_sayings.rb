class CreateSayings < ActiveRecord::Migration
  def change
    create_table :sayings do |t|
      t.string :german
      t.string :english

      t.timestamps null: false
    end
  end
end
