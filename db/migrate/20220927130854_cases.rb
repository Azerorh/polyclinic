class Cases < ActiveRecord::Migration[7.0]
  def change
    create_table :cases do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :question
      t.text :answer
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
