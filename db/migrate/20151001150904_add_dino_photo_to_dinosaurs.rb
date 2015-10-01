class AddDinoPhotoToDinosaurs < ActiveRecord::Migration
  def change
    add_column :dinosaurs, :dino_photo, :string
  end
end
