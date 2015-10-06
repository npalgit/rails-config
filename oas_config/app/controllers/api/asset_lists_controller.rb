module Api
  class AssetListsController < Api::BaseApiController

    # def show
    #   @asset_list = AssetList.find(params[:id])
    #   @result = {
    #     asset_list: @asset_list
    #   }
    #   @result[:assets] = @asset_list.assets if params[:include_assets]
    #   @result[:accounts] = @asset_list.accounts if params[:include_accounts]
    #
    #   render json: @result.to_json
    # end

    def update
      super
      if params[:asset_list][:assets]
        @asset_list[:asset_list].asset_ids = params[:asset_list][:assets]
        @asset_list[:asset_list].save
      end
    end

    def asset_list_params
      params.require(:asset_list).permit(:version, :url, :asset_type, :script_created, :script_last_modified, :assets)
    end
  end
end
