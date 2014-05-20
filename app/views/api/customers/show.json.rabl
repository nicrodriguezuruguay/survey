object @customer => :customer

attributes :id, :name, :email, :identifier,
           :added_up_info, :custom_field_values

child :last_5_events, { object_root: false, root: 'last_5_events' } do
  attributes :id, :created_at

  child :action do
    attributes :name, :slug
  end

  child :event_custom_fields, { object_root: false } do
    attributes :id, :value

    child :custom_field do
      attributes :id, :name, :slug, :field_type
    end
  end
end
