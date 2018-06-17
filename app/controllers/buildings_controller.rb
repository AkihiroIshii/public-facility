class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end
  
  def new
    @building = Building.new
  end
  
  def create
    @building = Building.new(building_params)
    
    if @Building.save
      flash[:success] = '建物が正常に作成されました'
      redirect_to @building
    else
      flash.now[:danger] = '建物が作成されませんでした'
      render :new
    end
  end
  
  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    
    if @Building.update(building_params)
      flash[:success] = '建物が正常に更新されました'
      redirect_to @building
    else
      flash.now[:danger] = '建物が更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @building = Building.find(params[:id])
    @Building.destroy
    
    flash[:success] = '建物は正常に削除されました'
    redirect_to buildings_url
  end
  
  private
    
  # Strong Parameter
  def building_params
    params.require(:building).permit(:building_number, :name, :construction_year, :floor_area, :last_updated_user_id)
  end

end
