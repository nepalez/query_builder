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

Builder of the CQL (Cassandra Query Language) 3.2 requests.

Synopsis
--------

```ruby
require "cql_builder"

include CQLBuilder::Operators

builder = CQLBuilder
  .select(:id, :role, name: :user)
  .use(:auth)
  .from(:users)
  .where(id: gt(1))
  .where(id: lte(4))
  .limit(3)
# => #<CQLBuilder::Statements::Select ...>

builder.to_s
# => "SELECT 'id', 'user' AS 'name', 'role' FROM 'auth'.'users' WHERE 'id' > 1 AND 'id' <= 4 USING 'consistency' = 'quorum' LIMIT 3
```

The gem doesn't depend on any specific Cassandra driver.

It could be used to extend [official Datastax driver](https://github.com/datastax/ruby-driver) with features of CQL building.

DSL
---

The builder provides an immutable abstract tree and converts it to CQL statement by `cql` method.

Its DSL defines 4 groups of commands:

* Statement Builders
* Statement Modifiers
* Operators
* Finalizer

### Statement Builders

Building CQL statement should begin from one of those `CQLBuilder` singleton methods.

Every method returns an immutable instance of the `CQLBuilder::Statement` class, describing the corresponding AST.

```ruby
builder = CQLBuilder.select(:id, :name, :role)
# => #<CQLBuilder::Statement::Select ... >

builder.frozen?
# => true

builder.statement
# => "SELECT id name role"
```

See the [list of supported statements](https://github.com/nepalez/cql_builder/wiki).

### Statement Modifiers

Every statement defines its own methods to add parts to the corresponding statement.

Because the statement is immutable, modifiers return a new statement of the updated AST. Chaining is available.

```ruby
builder = CQLBuilder.select(:id, :name, :role)
builder.statement
# => "SELECT id name role"

builder.from(:users)
# => #<CQLBuilder::Statement::Select ... >
builder.statement
# => "SELECT id name role FROM users"
```

See lists of supported modifiers (clauses) for [corresponding statements](https://github.com/nepalez/cql_builder/wiki).

### Operators

Operators are used in statements like `SELECT`, `SET` and `WHERE` to provide queries, assignments and conditions.

Include the `CQLBuilder::Operators` module to add operators to the current context:

```ruby
include CQLBuilder::Operators

builder = CQLBuilder.select count[:value]

builder.statement
# => "SELECT COUNT(value)"
```

```ruby
include CQLBuilder::Operators

builder = CQLBuilder
  .select(:id, :name, :role)
  .where(id: lt(100), role: inside["admin", "moderator"])
  .where(id: gte(10))

builder.statement
# => "SELECT id name role WHERE id < 100 AND role IN ('admin', 'moderator') AND id >= 10"
```

```ruby
include CQLBuilder::Operators

builder = CQLBuilder.update(:users).set hits: increment(3)

builder.statement
# => "UPDATE users SET hits = hits + 3"
```

If you don't want including the whole `CQLBuilder::Operators` module, call the operator explicitly, using square brackets:

```ruby
builder = CQLBuilder.update(:users).set hits: CQLBuilder::Operators[:increment, 3]
```

See lists of applicable operators for [corresponding statements](https://github.com/nepalez/cql_builder/wiki).

### Finalizer

The `Statement#to_s` method provides the sting of CQL statement.

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
