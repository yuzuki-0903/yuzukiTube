class CreateVideoCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :video_categories do |t|

      t.timestamps
    end
  end
end
