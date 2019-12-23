class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :pproject, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
