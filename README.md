# Private Events

An Eventbrite clone

**In this App** users can register, and create *events*. The events can have
many *attendees*. You can look up all events, or events related to any host or
participant. The events are grouped, in the lists where they occur, by past or
upcoming events.

**Note** While host can create events using the interface, participants need 
to be added to each event in the console. _This will be corrected in a future
update._

    Event.find(:event_id).attendees << User.find(:user_id)

or

    User.find(:user_id).attended_events << Event.find(:event_id)

**Note** All created events (with user as the host) can be retreived using

    User.find(:id).events

Events can be grouped into past and upcoming using the callbacks `Event.past`
or `Event.upcoming`.

## Setup

clone this repo, and run `rails db:migrate`

## Tests

`rspec spec/features`