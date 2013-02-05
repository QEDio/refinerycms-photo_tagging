module Refinery
  module PhotoTaggings
    class PhotoTaggingsController < ::ApplicationController

      before_filter :find_all_photo_taggings
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @photo_tagging in the line below:
        present(@page)
      end

      def show
        @photo_tagging = PhotoTagging.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @photo_tagging in the line below:
        present(@page)
      end

    protected

      def find_all_photo_taggings
        @photo_taggings = PhotoTagging.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/photo_taggings").first
      end

    end
  end
end
