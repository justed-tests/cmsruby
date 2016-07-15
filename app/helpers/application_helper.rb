# helpers for application
module ApplicationHelper
  def url_for_page(page)
    slug = page.slug
    root_path + (slug.present? ? slug : "pages/#{page.id}")
  end

  def url_for_menu_item(item)
    url = item.url
    if url =~ %r{:\/\/}
      url
    else
      root_path + url
    end
  end

  private

  # kill it
  def root_path
    '/'
  end
end
