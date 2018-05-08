class Admin::UsersController < Admin::AdminController
  before_action :load_user, only: [:edit, :update, :destroy]
  after_action :activated?, only: [:edit, :update]

  def index
    @users = User.order_user.search_by_name(params[:search])
      .page(params[:page]).per.Setting.paginate.page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controller.admin.users.sc_user"
    else
      flash[:danger] = t "controller.admin.users.fail_user"
      render :new
    end
    redirect_to admin_users_path
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controller.admin.users.ud_user"
    else
      flash[:error] = t "controller.admin.users.fail_ud_user"
    end
    redirect_to admin_users_path
  end

  def destroy
    if @user.destroy
      flash[:success] = t "controller.admin.users.del_user"
    else
      flash[:error] = t "controller.admin.users.fail_del_user"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def activated?
    @user.activated = params[:user][:activated] == "0" ? false : true
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:error] = t "controller.admin.users.load_user"
    redirect_to admin_users_path
  end
end
