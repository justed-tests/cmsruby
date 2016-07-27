module Admin
  # controller !
  class MenusController < AdminController
    before_action :set_menu, only: [:edit, :update, :destroy]

    def index
      @menus = Menu.all
    end

    def new
      @menu = Menu.new
      3.times { @menu.menu_items.build }
    end

    def create
      @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to admin_menus_path, notice: 'menu successfully created'
      else
        render :new
      end
    end

    def update
      if @menu.update(menu_params)
        redirect_to admin_menus_path, notice: 'menu successfully updated'
      else
        render :edit
      end
    end

    def edit
      3.times { @menu.menu_items.build }
    end

    def destroy
      if @menu.destroy
        redirect_to admin_menus_path, notice: 'menu was deleted'
      else
        redirect_to admin_menus_path, notice: 'menu was not deleted'
      end
    end

    private

    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name,
                                   menu_items_attributes: [:id,
                                                           :title,
                                                           :url])
    end
  end
end
