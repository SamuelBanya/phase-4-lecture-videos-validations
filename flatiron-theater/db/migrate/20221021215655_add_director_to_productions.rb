class AddDirectorToProductions < ActiveRecord::Migration[7.0]
  def change
    add_column :productions, :director, :string
  end
end
