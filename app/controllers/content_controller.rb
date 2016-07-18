# super template system
class ContentController < ApplicationController
  before_filter :set_theme

  def set_theme
    theme = 'default'
    # from app root
    prepend_view_path "app/views/themes/#{theme}"
    #self.class.layout(Rails.root.to_s + "/app/views/themes/#{theme}/layout")
    self.class.layout '../themes/default/layout' 
    #self.class.layout '../../themes/default/layout' 
  end
end
