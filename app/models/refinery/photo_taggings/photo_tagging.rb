module Refinery
  module PhotoTaggings
    class PhotoTagging < Refinery::Core::BaseModel
      self.table_name = 'refinery_photo_taggings'

      attr_accessible :id, :photo_id, :titel, :x1, :y1, :x2, :y2, :width, :height, :position

      acts_as_indexed :fields => [:titel]

      validates :titel, :presence => true, :uniqueness => true
    end
  end
end
