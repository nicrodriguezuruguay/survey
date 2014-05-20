class Customer < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :answer, dependent: :destroy

  def last_5_events
    events.limit(5).order('id DESC')
  end

  def added_up_info
    added_up_info = []
    custom_fields = CustomField.where(on_event: CustomField::ADD_UP)
    addup_values = EventCustomField.where([
      'custom_field_id IN (?)', custom_fields.map(&:id)
    ]).includes(:custom_field)
    addup_value = addup_values.order(:custom_field_id)
    addup_values.each do |value|
      if added_up_info.empty? ||
         added_up_info.last[:name] != value.custom_field.name
        added_up_info << {
          name: value.custom_field.name,
          value: value.value.to_f
        }
      end
      added_up_info.last[:value] = added_up_info.last[:value] + value.value.to_f
    end
    added_up_info
  end

  def custom_field_values
    custom_field_values = []
    custom_fields = CustomField.where(on_event: CustomField::REPLACE)
    values = EventCustomField.where([
      'custom_field_id IN (?)', custom_fields.map(&:id)
    ]).includes(:custom_field)
    values = values.order(:id)
    values.each do |value|
      if custom_field_values.empty? ||
         custom_field_values.last[:name] != value.custom_field.name
        custom_field_values << {
          name: value.custom_field.name,
          value: value.value
        }
      end
      custom_field_values.last[:value] = value.value
    end
    custom_field_values
  end
end
