class AddFullNameToWaiver < ActiveRecord::Migration
  def change
    add_column :waivers, :full_name, :string
  end
end
