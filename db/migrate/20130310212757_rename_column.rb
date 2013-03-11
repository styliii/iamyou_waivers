class RenameColumn < ActiveRecord::Migration
  def up
    rename_column :waivers, :png, :json_signature
  end

  def down
    rename_column :waivers, :json_signature, :png
  end
end
