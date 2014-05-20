class Api::CustomersController < ApplicationController

  def index
    @current_user = User.first
    @customers = @current_user.account.customers
  end

  def show
    @current_user = User.first
    @customer = @current_user.account.customers.find(params[:id])
  end

  def create
    @current_user = User.first
    params = permitted_params[:model]
    @customer = @current_user.account.customers.build(params)
    if @customer.save
      render action: :show
    else
      render status: 400, json: { errors: @customer.errors.full_messages }
    end
  end

  def destroy
    @current_user = User.first
    customer = @current_user.account.customers.find(params[:id])
    customer.destroy
    render json: {}
  end

  private

  def permitted_params
    params.permit(model: [:identifier, :name, :email])
  end

end
