module Refinery
  module PhotoTaggings
    module Admin
      class PhotoTaggingsController < ::Refinery::AdminController

        crudify :'refinery/photo_taggings/photo_tagging',
                :title_attribute => 'titel', :xhr_paging => true

      end
    end
  end
end
