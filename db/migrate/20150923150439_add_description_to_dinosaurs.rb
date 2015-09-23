class AddDescriptionToDinosaurs < ActiveRecord::Migration
  def change
    add_column :dinosaurs, :description, :string, null: false
  end
end
