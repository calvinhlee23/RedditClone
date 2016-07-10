class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false, unique: true
      t.text :description, null: false
      t.integer :user_id, null: false #creator of this subs

      t.timestamps null: false


    end
  end
end
