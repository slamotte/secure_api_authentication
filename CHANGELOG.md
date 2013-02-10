# Change History / Release Notes

## Version 0.2.2
* Closed Issue #5 - Improperly formatted timestamps result in an uncaught exception

## Version 0.2.1

* Closed Issue #3 - Failing to define an environment in the YML causes a fatal error
* Closed Issue #4 - Changes to the request_window in the YML were ignored in favor of the default 4 minute window

## Version 0.2.0

* Added verbose error messaging; if this is enabled in the YML config file, then the response to an authentication failure will be more descriptive as to why the authentication failed. To enable, add `verbose_errors: true` to the `config/secure_api_authentication.yml`.

## Version 0.1.2

* Resolved Issue #2: UUID gem is not required and therefore throws an error when this gem is used.
* Added some documentation on how to use the master authentication.
* Updated change history / release notes.

## Version 0.1.1

* Resolved Issue #1: Using authenticated_master? in before filter results in an error

## Version 0.1.0

* Initial release. See README.md for details.