Rails.application.routes.draw do |map|

  mount_at = Dioxide::Engine.config.mount_at

  match mount_at => 'dioxide/api#call', :via => [:post], :format => :json

end
