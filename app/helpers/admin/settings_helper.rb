module Admin
  # help help help
  module SettingsHelper
    def homepage_options
      grouped_options_for_select({
        'Pages' => Page.all.map { |page| [page.title, url_for_page(page)] },
        'Categories' => Category.all.map { |cat| [cat.name, category_path(cat)] }
      }, Setting.find_by(key: 'homepage').value)
    end

    def theme_options
      options_for_select(
        @themes.map { |theme| ["#{theme.name} by #{theme.author}", theme.id] },
        Setting.find_by(key: 'theme').value
      )
    end
  end
end
