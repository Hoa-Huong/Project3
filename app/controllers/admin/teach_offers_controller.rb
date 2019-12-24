class Admin::TeachOffersController < AdminController
  before_action :find_teach_offer, only: %i(show update destroy)

  def index
    @teach_offers = TeachOffer.all
  end

  def show
    respond_to :js
  end

  def destroy
    if @teach_offer.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa không thành công"
    end
    redirect_to admin_teach_offers_path

  end

  def update
    if @teach_offer.update! status: params[:status]
      flash[:success] = "Cập nhật thành công!"
    else
      flash[:danger] = "Cập nhật không thành công!"
    end
    redirect_to admin_teach_offers_path
  end

  private

  def find_teach_offer
    @teach_offer = TeachOffer.find_by id: params[:id]
    return if @teach_offer

    flash[:danger] = "Không tìm thấy đề nghị dạy nào!"
    redirect_to admin_teach_offers_path
  end
end
