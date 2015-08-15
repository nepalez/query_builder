[WIP] CQLBuilder
================

[![Gem Version](https://img.shields.io/gem/v/cql_builder.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/cql_builder/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/cql_builder.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/cql_builder.svg?style=flat)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/nepalez/cql_builder.svg?style=flat)][coveralls]
[![Inline docs](http://inch-ci.org/github/nepalez/cql_builder.svg)][inch]

[codeclimate]: https://codeclimate.com/github/nepalez/cql_builder
[coveralls]: https://coveralls.io/r/nepalez/cql_builder
[gem]: https://rubygems.org/gems/cql_builder
[gemnasium]: https://gemnasium.com/nepalez/cql_builder
[travis]: https://travis-ci.org/nepalez/cql_builder
[inch]: https://inch-ci.org/github/nepalez/cql_builder

Builder of [CQL 3](https://cassandra.apache.org/doc/cql3/CQL.html#CassandraQueryLanguageCQLv3.2.0) (Cassandra Query Language) statements.

Synopsis
--------

```ruby
require "cql_builder"

include CQLBuilder::Operators # for operators like cql_gt, cql_lte below.

builder = CQLBuilder
  .select(:id, :role, name: :user)
  .use(:auth)
  .from(:users)
  .where(id: cql_gt(1))
  .where(id: cql_lte(4))
  .limit(3)
# => #<CQLBuilder::Statements::Select ...>

builder.to_s
# => "SELECT id, role, user AS name FROM auth.users WHERE id > 1 AND id <= 4 USING consistency = 'quorum' LIMIT 3;"
```

See the [full list of all supported statements and operators](https://github.com/nepalez/cql_builder/wiki).

The gem doesn't depend on any specific Cassandra driver. It could be used to extend [official Datastax driver](https://github.com/datastax/ruby-driver) with features of CQL building.

Installation
------------

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem "cql_builder"
```

Then execute:

```
bundle
```

Or add it manually:

```
gem install cql_builder
```

Compatibility
-------------

Tested under rubies [compatible to MRI 1.9.3+](.travis.yml).

Uses [RSpec] 3.0+ for testing and [hexx-suit] for dev/test tools collection.

[RSpec]: http://rspec.org
[hexx-suit]: https://github.com/nepalez/hexx-suit

Contributing
------------

* Read the [STYLEGUIDE](config/metrics/STYLEGUIDE)
* [Fork the project](https://github.com/nepalez/cql_builder)
* Create your feature branch (`git checkout -b my-new-feature`)
* Add tests for it
* Commit your changes (`git commit -am '[UPDATE] Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create a new Pull Request

License
-------

See the [MIT LICENSE](LICENSE).
