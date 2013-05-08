class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :comments

      t.timestamps
    end
  end
end
