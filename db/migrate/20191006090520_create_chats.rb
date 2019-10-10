class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
    	t.integer :video_id, null: false
    	t.integer :user_id, null: false
    	t.text :message, null: false
    	
      t.timestamps
    end
  end
end
