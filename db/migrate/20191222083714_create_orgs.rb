class CreateOrgs < ActiveRecord::Migration[6.0]
  def change
    create_table :orgs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
