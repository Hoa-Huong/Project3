class Admin::DemandsController < AdminController
  before_action :find_demand, except: :index

  def index
    @demands = if params[:search]
      Demand.joins(:user).where('subject LIKE ? OR users.name LIKE ? OR users.phone LIKE ?', "%#{params[:search]}% ", "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC").page(params[:page]).per 20
    else
      Demand.order("created_at DESC").page(params[:page]).per 20
    end

  end

  def edit
    respond_to :js
  end

  def update
    if @demand.update! status_admin: params[:status_admin]
      flash[:success] = "Cập nhật thành công"
    else
      flash[:danger] = "Cập nhật thất bại"
    end
    redirect_to admin_demands_path
  end

  def destroy
    if @demand.destroy
      flash[:success] = "Xóa nhu cầu thành công"
    else
      flash.now[:danger] = "Xóa nhu cầu không thành công"
    end
    redirect_to admin_demands_path
  end

  private

  def find_demand
    @demand = Demand.find_by id: params[:id]
    return if @demand

    flash[:danger] = "Không tồn tại nhu cầu"
    redirect_to root_url
  end

  def demand_params
    params.require(:demand).permit(:user_id, :subject, :level, :amount_student, :time_per_session, :fee, :note, :address, :status, :status_admin)
  end
end
