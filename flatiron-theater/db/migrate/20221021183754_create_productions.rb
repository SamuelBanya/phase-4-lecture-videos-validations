class CreateProductions < ActiveRecord::Migration[7.0]
  def change
    create_table :productions do |t|
      t.string :title
      t.string :genre
      t.integer :budget
      t.string :image
      t.boolean :ongoing

      t.timestamps
    end
  end
end
