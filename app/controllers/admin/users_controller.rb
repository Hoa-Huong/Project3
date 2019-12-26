class Admin::UsersController < AdminController
  include UserAction

  def index
    @users = if params[:search]
      @users = User.where('name LIKE ? OR phone LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC").page(params[:page]).per 20
    else
      @users = User.order("created_at DESC").page(params[:page]).per 20
    end
  end

  def show
    @user = User.find_by id: params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find_by id: params[:id]
    begin
      @user.destroy!
      flash[:success] = "Xóa người dùng thành công"
    rescue
      flash[:danger] = "Không thể xóa do người dùng có đăng ký nhu cầu"
    ensure
      redirect_to admin_users_path
    end
  end
end
