class PagesController < ContentController
  def show
    @page = Page.find(params[:id])

    render template: 'page'
  end
end
