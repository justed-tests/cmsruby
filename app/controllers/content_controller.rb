# super template system
class ContentController < ApplicationController
  before_filter :set_theme
  before_filter :retrieve_menus

  def set_theme
    theme = Setting.find_by(key: 'theme').value
    # from app root
    prepend_view_path "app/views/themes/#{theme}"
    self.class.layout "../themes/#{theme}/layout"
  end

  def retrieve_menus
    @menus = Menu.all
  end
end
