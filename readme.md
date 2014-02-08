Overview
=========

A (very) simple wrapper for Google Analytics' new Universal Measurement API. Send
events to GA server side.



Usage
=====

Initialize GAMeasurements with your tracker/property ID, and a UUID for the
individual user (which is used to track the user across multiple actions, see
https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cid).

If you don't pass in a UUID, one will be randomly generated.

Just initialize GAMeasurements with your property ID and (optionally) UUID:

```ruby
ga = GAMeasurements.new('UA-XXXX-Y', user_uuid)
```

And start sending hits:

```ruby
ga.pageview({ dp: '/example', dh: 'example.com', dt: 'Foo' })
ga.event({ ec: '/example', ea: 'example.com' })
ga.transaction({ ti: 12345, tr: 50.00, cu: 'EUR' })
```

Each hit type has it's own method (see below), and accepts a single argument hash
which passes values through directly to Analytics. See parameters for each hit
type at https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters.

The required `t`, `cid`, `tid`, and `v` parameters will automatically be added.

Hit Types
---------

* `pageview`
* `event`
* `item`
* `transaction`
* `social`
* `exception`
* `timing`
* `appview`
