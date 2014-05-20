collection @actions, { root: 'actions', object_root: false }

attributes :id, :name, :description, :slug

node :comma_separated_actions do |action|
  actions = action.custom_fields.map do |action|
    "#{action.name} (#{action.slug}, #{action.on_event})"
  end
  actions = actions.join(', ')
  actions.empty? ? nil : actions
end
