class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.integer :correct, default: 0
      t.integer :incorrect, default: 0
      t.float :percent, default: 0
      t.timestamps
    end
  end
end
