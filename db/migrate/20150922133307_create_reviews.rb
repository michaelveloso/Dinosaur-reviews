class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :dinosaur, null: false
      t.string :body, null: false
      t.integer :rating, null: false
    
      t.timestamps
    end
  end
end
