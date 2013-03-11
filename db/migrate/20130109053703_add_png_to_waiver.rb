class AddPngToWaiver < ActiveRecord::Migration
  def change
    add_column :waivers, :png, :string
  end
end
