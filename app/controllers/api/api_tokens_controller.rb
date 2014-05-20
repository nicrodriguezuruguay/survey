class Api::ApiTokensController < ApplicationController

  def index
    @current_user = User.first
    @api_tokens = @current_user.account.api_tokens
  end

  def create
    @current_user = User.first
    params = permitted_params[:model]
    @api_token = @current_user.account.api_tokens.build(params)
    if @api_token.save
      render action: :show
    else
      render status: 400, json: { errors: @api_token.errors.full_messages }
    end
  end

  def destroy
    @current_user = User.first
    api_token = @current_user.account.api_tokens.find(params[:id])
    api_token.destroy
    render json: {}
  end

  private

  def permitted_params
    params.permit(model: [:name])
  end

end
