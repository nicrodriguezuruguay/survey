class Api::AnalysesController < ApplicationController

  def create
    @result = {}

    # Fecth events for action
    events = Event.where(action_id: params[:action_id])
    events = events.includes(:customer)

    # Users by action
    customers = events.map(&:customer)
    customers = customers.uniq(&:id)
    customers.map! do |customer|
      customer_count = events.select { |e| e.customer.id == customer.id }.size
      {
        id: customer.id,
        name: customer.name,
        percentage: (customer_count.to_f / events.size.to_f) * 100
      }
    end
    @result[:customers] = customers

    # Follow up actions
    event_ids = events.map(&:id)
    followups = Event.where(['previous_event_id IN (?)', event_ids])
    followups = followups.includes(:action)
    actions = followups.map(&:action)
    actions = actions.uniq(&:id)
    actions.map! do |action|
      action_count = followups.select { |fu| fu.action.id == action.id }.size
      {
        id: action.id,
        name: action.name,
        percentage: (action_count.to_f / followups.size.to_f) * 100
      }
    end
    @result[:followups] = actions

    render_result
  end

  private

  def render_result
    render json: { result: @result }
  end

end
