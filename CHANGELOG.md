## v0.0.5 to be released

### Internal

* Switched to 'immutability' gem (nepalez)

[Compare v0.0.4...HEAD](https://github.com/nepalez/query_builder/compare/v0.0.4...HEAD)

## v0.0.4 2015-09-18

The (backward-compatible) patch fixes a bug in 'SELECT' statement.

### Bugs Fixed

* Fixed 'ORDER BY' condition in 'SELECT' statement (nepalez) with reference to bug report #1 (aq1018)

### Internal

* Extracted `Core::Attributes` to the external gem 'attributes_dsl' (nepalez)

### Deleted

* `Core::Attributes` (nepalez)
* `Core::AttributesDSL` (nepalez)

[Compare v0.0.3...v0.0.4](https://github.com/nepalez/query_builder/compare/v0.0.3...v0.0.4)

## v0.0.3 2015-08-21

### Added

* Add `set` alias to `update` table method (nepalez)
* Support `insert` and `update` without options (nepalez)

[Compare v0.0.2...v0.0.3](https://github.com/nepalez/query_builder/compare/v0.0.2...v0.0.3)

## v0.0.2 2015-08-21

### Bugs fixed

* Required ruby version (nepalez)

[Compare v0.0.1...v0.0.2](https://github.com/nepalez/query_builder/compare/v0.0.1...v0.0.2)

## v0.0.1 2015-08-20

First release

[Compare Initial...v0.0.1](https://github.com/nepalez/query_builder/compare/Initial...v0.0.1)
