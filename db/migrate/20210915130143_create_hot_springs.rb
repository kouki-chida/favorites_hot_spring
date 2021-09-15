class CreateHotSprings < ActiveRecord::Migration[5.2]
  def change
    create_table :hot_springs do |t|

      t.timestamps
    end
  end
end
