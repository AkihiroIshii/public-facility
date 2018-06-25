class BuildingsController < ApplicationController
  before_action :require_user_logged_in

  def index
    @buildings = Building.all
    @total_floor_area = @buildings.sum(:floor_area)
  end

  def show
    @building = Building.find(params[:id])
    @facility = Facility.find_by(id: @building.facility_id)
    @user = User.find(@building.last_updated_user_id)
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.relationships.build(facility_id: building_params[:facility_id])

    if @building.save
      flash[:success] = '建物が正常に作成されました'
      redirect_to @building
    else
      flash.now[:danger] = '建物が作成されませんでした'
      render :new
    end
  end

  def edit
    @building = Building.find(params[:id])
    #@user = User.find(@building.last_updated_user_id)
  end

  def update
    @building = Building.find(params[:id])
    @building.relationships.build(facility_id: building_params[:facility_id])

    # 更新前の関連インスタンスを削除
    #（validation エラーでも削除されるため、存在している場合のみ削除）
    previous_relationship = Relationship.find_by( \
      facility_id: params[:previous_facility_id], \
      building_id: params[:id] \
    )
    previous_relationship.destroy if !!previous_relationship

    if @building.update(building_params)
      flash[:success] = '建物が正常に更新されました'
      redirect_to @building
    else
      # 削除した関連インスタンスを再作成
      Relationship.create( \
        facility_id: params[:previous_facility_id], \
        building_id: params[:id]
      )
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
