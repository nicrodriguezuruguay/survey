Account.destroy_all
Action.destroy_all
Event.destroy_all
Customer.destroy_all
ApiToken.destroy_all
CustomField.destroy_all

Account.create!({
  name: 'Dummy account'
})
User.create!({
  account_id: Account.first.id,
  email: 'dummy@user.com'
})

# API tokens
ApiToken.create!({
  account_id: Account.first.id,
  name: 'Dummy API token'
})

# Customers
customers = {}
customers[:nico] = Customer.create!({
  account_id: Account.first.id,
  name: 'Nicolas Rodriguez',
  email: 'nic@rodr.com',
  identifier: 'nico'
})
customers[:banafederico] = Customer.create!({
  account_id: Account.first.id,
  name: 'Federico Bana',
  email: 'bana@federico.com',
  identifier: 'banafederico'
})
customers[:andrewlech] = Customer.create!({
  account_id: Account.first.id,
  name: 'Andrew Lech',
  email: 'andrew@lech.com',
  identifier: 'andrewlech'
})
customers[:danreynolds] = Customer.create!({
  account_id: Account.first.id,
  name: 'Dan Reynolds',
  email: 'dan@reynolds.com',
  identifier: 'danreynolds'
})

# Actions
actions = {}
actions[:signin] = Action.create!({
  account_id: Account.first.id,
  name: 'Sign in',
  slug: 'signin'
})
actions[:homepage] = Action.create!({
  account_id: Account.first.id,
  name: 'See homepage',
  slug: 'homepage'
})
actions[:opencontactform] = Action.create!({
  account_id: Account.first.id,
  name: 'Open contact form',
  slug: 'opencontactform'
})
actions[:closecontactform] = Action.create!({
  account_id: Account.first.id,
  name: 'Close contact form',
  slug: 'closecontactform'
})
actions[:createcontact] = Action.create!({
  account_id: Account.first.id,
  name: 'Create contact',
  slug: 'createcontact'
})
actions[:seecontactlist] = Action.create!({
  account_id: Account.first.id,
  name: 'See contact list',
  slug: 'seecontactlist'
})
actions[:seecontactdetails] = Action.create!({
  account_id: Account.first.id,
  name: 'See contact details',
  slug: 'seecontactdetails'
})

# Custom fields
CustomField.create!({
  account_id: Account.first.id,
  action_id: actions[:createcontact].id,
  name: 'Revenue',
  slug: 'revenue',
  on_event: 'addup'
})
CustomField.create!({
  account_id: Account.first.id,
  action_id: actions[:createcontact].id,
  name: 'Count',
  slug: 'signin',
  on_event: 'addup'
})

# Events
# nico create!s a contact
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:signin] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:homepage] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:seecontactlist] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:opencontactform] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:createcontact] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:closecontactform] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:seecontactdetails] })

# banafederico create!s a contact
Event.create!({ account: Account.first, customer: customers[:banafederico], action: actions[:signin] })
Event.create!({ account: Account.first, customer: customers[:banafederico], action: actions[:homepage] })
Event.create!({ account: Account.first, customer: customers[:banafederico], action: actions[:seecontactlist] })
Event.create!({ account: Account.first, customer: customers[:banafederico], action: actions[:opencontactform] })
Event.create!({ account: Account.first, customer: customers[:banafederico], action: actions[:createcontact] })
Event.create!({ account: Account.first, customer: customers[:banafederico], action: actions[:closecontactform] })
Event.create!({ account: Account.first, customer: customers[:banafederico], action: actions[:seecontactdetails] })

# nico create!s a contact a different way
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:signin] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:homepage] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:opencontactform] })
event = Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:createcontact] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:closecontactform] })
Event.create!({ account: Account.first, customer: customers[:nico], action: actions[:seecontactdetails] })

# Some custom data for nico
EventCustomField.create!({
  account_id: Account.first.id,
  custom_field_id: CustomField.find_by(slug: 'signin').id,
  event_id: event.id,
  value: '1'
})
EventCustomField.create!({
  account_id: Account.first.id,
  custom_field_id: CustomField.find_by(slug: 'revenue').id,
  event_id: event.id,
  value: '1000'
})

# andrew doubts about creating a contact
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:signin] })
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:homepage] })
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:opencontactform] })
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:closecontactform] })
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:opencontactform] })
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:createcontact] })
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:closecontactform] })
Event.create!({ account: Account.first, customer: customers[:andrewlech], action: actions[:seecontactdetails] })

# dan doesnt create! a contact
Event.create!({ account: Account.first, customer: customers[:danreynolds], action: actions[:signin] })
Event.create!({ account: Account.first, customer: customers[:danreynolds], action: actions[:homepage] })
Event.create!({ account: Account.first, customer: customers[:danreynolds], action: actions[:seecontactlist] })
Event.create!({ account: Account.first, customer: customers[:danreynolds], action: actions[:opencontactform] })
Event.create!({ account: Account.first, customer: customers[:danreynolds], action: actions[:closecontactform] })
