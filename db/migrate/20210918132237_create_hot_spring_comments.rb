class CreateHotSpringComments < ActiveRecord::Migration[5.2]
  def change
    create_table :hot_spring_comments do |t|
      t.integer "user_id"
      t.integer "hot_spring_id"
      t.text "comment"


      t.timestamps
    end
  end
end
