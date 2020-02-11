# Private Events

An Eventbrite clone

**In this App** users can register, and create *events*. The events can have
many *attendees*. You can look up all events, or events related to any host or
participant. The events are grouped, in the lists where they occur, by past or
upcoming events.

**Note** While host can create events using the interface, participants need 
to be added to each event in the console. This will be corrected in a future
update.

    Event.find(:event_id).attendees << User.find(:user_id)

or

    User.find(:user_id).attended_events << Event.find(:event_id)

## Setup

clone this repo, and run `rails db:migrate`

## Tests

`rspec spec/features`