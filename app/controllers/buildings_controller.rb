class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
    @facility = Facility.find_by(id: @building.facility_id)
  end
  
  def new
    @building = Building.new
  end
  
  def create
    @building = Building.new(building_params)

    if @building.save
      #relationship = @building.relationships.build(facility_id: params[:facility_id])
      relationship = @building.relationships.build(facility_id: @building.facility_id)
      if relationship.save
        flash[:success] = '建物が正常に作成されました'
        redirect_to @building
      else
        flash.now[:danger] = '建物が作成されませんでした'
        render :new
      end
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
    
    if @building.update(building_params)
      flash[:success] = '建物が正常に更新されました'
      redirect_to @building
    else
      flash.now[:danger] = '建物が更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    
    flash[:success] = '建物は正常に削除されました'
    redirect_to buildings_url
  end
  
  private
    
  # Strong Parameter
  def building_params
    params.require(:building).permit(:building_number, :name, :facility_id, :construction_year, :floor_area, :last_updated_user_id)
  end

end
