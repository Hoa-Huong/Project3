class Admin::DemandsController < AdminController
  before_action :find_demand, except: :index

  def index
    @demands = Demand.all
  end

  def show
    respond_to :js
  end

  def edit; end

  def update
    if @demand.update demand_params
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
    params.require(:demand).permit(:user_id, :subject, :level, :amount_student, :time_per_session, :fee, :note, :address, :status)
  end
end
