class AccountsController < ApiController
  def index
    @result = Account.all
    render json: @result.to_json
  end

  def show
    begin
      @account = Account.find_by_org_code params[:id]
      @result = {
        config: @account,
        assets: @account.get_assets
      }
      render json: @result.to_json
    rescue
      not_found
    end
  end
end