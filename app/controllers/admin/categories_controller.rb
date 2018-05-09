class Admin::CategoriesController < Admin::AdminController
  before_action :load_category, only: [:update, :edit, :destroy]

  def index
    @categories = Category.order_name.search_by_name(params[:search])
      .page(params[:page]).per Setting.paginate.page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t "controller.admin.users.sc_category"
    else
      flash[:error] = t "controller.admin.users.fail_category"
    end
    respond_to do |format|
      format.html redirect_to admin_categories_path
      format.js
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "controller.admin.users.ud_category"
      redirect_to admin_categories_path
    else
      flash[:error] = t "controller.admin.users.fail_ud_category"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "controller.admin.users.del_category"
    else
      flash[:error] = t "controller.admin.users.fail_del_category"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:error] = t "controller.admin.users.load_category"
    redirect_to admin_categories_path
  end
end
