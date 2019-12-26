class DemandsController < ApplicationController
  before_action :logged_in_user, except: :index
  before_action :find_my_demand, only: %i(show destroy)
  def new
    @demand = Demand.new
  end

  def index
    @demands = if params[:search]
      Demand.where('address LIKE ? OR subject LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC").page(params[:page]).per 10
    else
      Demand.order("created_at DESC").page(params[:page]).per 10
    end
  end

  def my_demand
    @my_demands = current_user.demands.order("created_at DESC")
  end

  def create
    @demand = current_user.demands.new demand_params
    if @demand.save
      flash[:success] = "Tạo nhu cầu thành công"
      redirect_to demand_path @demand
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @demand.destroy
      respond_to :js
    else
      flash.now[:danger] = t "delete_borrowed_details_fail"
      redirect_to demands_path
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:user_id, :subject, :level, :amount_student, :time_per_session, :fee, :note, :address, :status)
  end

  def find_my_demand
    @demand = current_user.demands.find_by id: params[:id]
    return if @demand

    flash[:danger] = "Không tồn tại nhu cầu"
    redirect_to root_url
  end
end
