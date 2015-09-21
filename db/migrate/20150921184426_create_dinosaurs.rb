class CreateDinosaurs < ActiveRecord::Migration
  def change
    create_table :dinosaurs do |t|
      t.string :name, null: false
      t.string :location_found, null: false
      t.string :info_url, null: false
      t.string :photo_url
      t.belongs_to :user

      t.timestamps null: false
    end
    add_index :dinosaurs, :name, { unique: true }
  end
end
