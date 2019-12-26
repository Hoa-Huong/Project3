class TeachOffersController < ApplicationController
  before_action :load_demand, only: :create
  before_action :logged_in_user
  def index
    @teach_offers = current_user.teach_offers.order("created_at DESC").page(params[:page]).per 10
  end

  def create
    @teach_offer = current_user.teach_offers.find_by demand_id: @chosen_demand.id
    if @teach_offer
      flash[:danger] = "Bạn đã đề nghị dạy trước đó !"
    else
      current_user.teach_offers.create demand_id: @chosen_demand.id
      flash[:success] = "Đề nghị dạy thành công, trung tâm sẽ liên hệ bạn trong vòng 24h"
    end
    redirect_to teach_offers_path
  end

  private

  def load_demand
    @chosen_demand = Demand.find_by id: params[:demand_id]
    return if @chosen_demand

    flash[:danger] = "Not done"
    redirect_to root_url
  end

  def find_chosen_demand

    return if @teach_offer

    flash[:danger] = "not found"
    redirect_to root_url
  end
end
