class AddSalaryToCrewMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :crew_members, :salary, :integer
  end
end
