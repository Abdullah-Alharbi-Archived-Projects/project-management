class CreatePprojects < ActiveRecord::Migration[6.0]
  def change
    create_table :pprojects do |t|
      t.references :org, null: false, foreign_key: true
      t.string :name
      t.string :wallpaper

      t.timestamps
    end
  end
end
