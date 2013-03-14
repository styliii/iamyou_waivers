class ChangeJSonSignatureType < ActiveRecord::Migration
  def up
  	change_column :waivers, :json_signature, :text
  end

  def down
  	change_column :waivers, :json_signature, :string
  end
end
