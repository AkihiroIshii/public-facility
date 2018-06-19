class RelationshipsController < ApplicationController
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationsihp.destroy
  end
end
