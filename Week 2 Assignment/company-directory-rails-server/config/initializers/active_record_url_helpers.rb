class ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionDispatch::Routing::UrlFor
  
  def default_url_options
    {:host => "localhost:3000"}
  end
  
  def url
    url_for(self)
  end
  
  def as_json(options = {})
    super(options.merge(:methods => [:url]))
  end
end