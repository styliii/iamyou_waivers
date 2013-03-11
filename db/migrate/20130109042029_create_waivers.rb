class CreateWaivers < ActiveRecord::Migration
  def change
    create_table :waivers do |t|

      t.timestamps
    end
  end
end
