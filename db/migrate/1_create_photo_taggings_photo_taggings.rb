class CreatePhotoTaggingsPhotoTaggings < ActiveRecord::Migration

  def up
    create_table :refinery_photo_taggings do |t|
      t.int :id
      t.int :photo_id
      t.string :titel
      t.int :x1
      t.int :y1
      t.int :x2
      t.int :y2
      t.int :width
      t.int :height
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-photo_taggings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/photo_taggings/photo_taggings"})
    end

    drop_table :refinery_photo_taggings

  end

end
