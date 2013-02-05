Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :photo_taggings do
    resources :photo_taggings, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :photo_taggings, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :photo_taggings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
