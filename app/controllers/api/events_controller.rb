class Api::EventsController < ApplicationController

  def index
    @current_user = User.first
    @events = @current_user.account.events.order(:id).limit(10)
    @events = @events.where(['id > ?', params[:last_event]])
  end

  def create
    api_token = ApiToken.find_by(token: permitted_params[:token])
    raise ActiveRecord::RecordNotFound if api_token.nil?

    account = api_token.account
    action = account.actions.find_by(slug: permitted_params[:event][:action])
    raise ActiveRecord::RecordNotFound if action.nil?

    customer = account.customers.find_by(identifier: permitted_params[:event][:customer])
    raise ActiveRecord::RecordNotFound if customer.nil?

    event = account.events.create({
      action_id: action.id,
      customer_id: customer.id
    })

    params[:event][:params].each do |slug, value|
      custom_field = CustomField.find_by(slug: slug)
      unless custom_field.nil?
        custom_field.event_custom_fields.create({
          account_id: account.id,
          event_id: event.id,
          value: value
        })
      end
    end

    render json: {}
  end

  private

  def permitted_params
    params.permit([
      :token,
      :event => [
        :action,
        :customer
      ]
    ])
  end

end
