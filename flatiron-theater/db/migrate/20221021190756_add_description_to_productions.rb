class AddDescriptionToProductions < ActiveRecord::Migration[7.0]
  def change
    add_column :productions, :description, :text
  end
end
