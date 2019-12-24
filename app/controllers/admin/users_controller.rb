class Admin::UsersController < AdminController
  include UserAction

  def index
    @users = User.all
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
