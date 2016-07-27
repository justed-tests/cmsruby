module Admin
  # controller !
  class TypesController < AdminController
    before_action :set_type, only: [:edit, :update, :destroy]

    def index
      @types = Type.all
    end

    def new
      @type = Type.new
      3.times { @type.field_definitions.build }
    end

    def create
      @type = Type.new(type_params)
      if @type.save
        redirect_to admin_types_path, notice: 'type successfully created'
      else
        render :new
      end
    end

    def update
      if @type.update(type_params)
        redirect_to admin_types_path, notice: 'type successfully updated'
      else
        render :edit
      end
    end

    def edit
      3.times { @type.field_definitions.build }
    end

    def destroy
      if @type.destroy
        redirect_to admin_types_path, notice: 'type was deleted'
      else
        redirect_to admin_types_path, notice: 'type was not deleted'
      end
    end

    private

    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name,
                                   field_definitions_attributes: [:id,
                                                                  :key])
    end
  end
end
