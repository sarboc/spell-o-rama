class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.integer :correct
      t.integer :incorrect
      t.integer :percent
      t.timestamps
    end
  end
end
