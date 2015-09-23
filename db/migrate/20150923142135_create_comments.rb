class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :review, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
