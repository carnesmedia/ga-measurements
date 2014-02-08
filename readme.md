[![Gem Version](https://badge.fury.io/rb/ga-measurements.png)](http://badge.fury.io/rb/ga-measurements)

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

`_ga` and user UUID
-------------------

To tie backend events to JavaScript-originated events, you'll need to get the
`clientId` from the Analytics JavaScript (shamelessly lifted from
http://stackoverflow.com/a/14281426/1251141) so you can pass it into during instantiation:

```javascript
ga(function(tracker) {
  var clientId = tracker.get('clientId');
});
```

Alternately, you can specify your own UUID when initializing the Analytics Javascript:

```javascript
ga('create', 'UA-XXXXX-Y', {'clientId': 'your_client_id'});
```

License
=======

The MIT License (MIT)

Copyright (c) 2014 Carnes Media LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

