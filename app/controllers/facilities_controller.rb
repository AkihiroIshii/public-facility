class FacilitiesController < ApplicationController
  before_action :require_user_logged_in

  def index
    @facilities = Facility.all
  end
  
  def show
    @facility = Facility.find(params[:id])
  end
  
  def new
    @facility = Facility.new
  end
  
  def create
    @facility = Facility.new(facility_params)
    
    if @facility.save
      flash[:success] = '施設が正常に作成されました'
      redirect_to @facility
    else
      flash.now[:danger] = '施設が作成されませんでした'
      render :new
    end
  end
  
  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    
    if @facility.update(facility_params)
      flash[:success] = '施設が正常に更新されました'
      redirect_to @facility
    else
      flash.now[:danger] = '施設が更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    
    flash[:success] = '施設は正常に削除されました'
    redirect_to facilities_url
  end
  
  private
    
  # Strong Parameter
  def facility_params
    params.require(:facility).permit(:facility_number, :name, :district, :address, :facility_type, :floor_area, :division_in_charge, :last_updated_user_id)
  end
end
