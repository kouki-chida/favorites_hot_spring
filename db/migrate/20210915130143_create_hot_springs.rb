class CreateHotSprings < ActiveRecord::Migration[5.2]
  def change
    create_table :hot_springs do |t|
      t.integer "hot_spring_id"
      t.integer "user_id"
      t.string "profile_image_url"
      t.string "name"
      t.text "text"
      
      t.timestamps
    end
  end
end
