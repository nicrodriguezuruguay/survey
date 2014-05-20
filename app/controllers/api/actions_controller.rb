class Api::ActionsController < ApplicationController

  before_filter :mock_current_user

  def index
    @actions = @current_user.account.actions
  end

  def create
    @action = @current_user.account.actions.build(permitted_params[:model])
    if @action.save
      params[:model][:custom_fields].each do |custom_field|
        custom_field = CustomField.create({
          account_id: @current_user.account.id,
          action_id: @action.id,
          name: custom_field[:name],
          slug: custom_field[:slug],
          on_event: custom_field[:on_event]
        })
      end
      render action: :show
    else
      render status: 400, json: { errors: @action.errors.full_messages }
    end
  end

  def destroy
    action = @current_user.account.actions.find(params[:id])
    action.destroy
    render json: {}
  end

  private

  def mock_current_user
    @current_user = User.first
  end

  def permitted_params
    params.permit(model: [:name, :description, :slug])
  end

end
