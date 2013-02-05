module Refinery
  module PhotoTaggings
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::PhotoTaggings

      engine_name :refinery_photo_taggings

      initializer "register refinerycms_photo_taggings plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "photo_taggings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.photo_taggings_admin_photo_taggings_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/photo_taggings/photo_tagging',
            :title => 'titel'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PhotoTaggings)
      end
    end
  end
end
