collection @events, { root: 'events', object_root: false }

attributes :id, :account_id, :action_id, :customer_id

child :action do
  attributes :id, :name
end

child :customer do
  attributes :id, :name, :email
end
