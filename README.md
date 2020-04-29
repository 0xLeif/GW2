# GW2

![Swift](https://github.com/zmeriksen/GW2/workflows/Swift/badge.svg?branch=master)

A [GW2 API](https://wiki.guildwars2.com/wiki/API:2) Wrapper written in Swift


## Accessing resources

Each endpoint can be accessed directly to get a list of resources. Each resource can be accessed as a subpath of the endpoint. Alternatively, a single resource can also be accessed by specifying the id query parameter at the base endpoint. Multiple resources can be specified by specifying the ids query parameter instead. The latter expects a comma-separated list of identifiers and returns an array of objects instead.

For example, /v2/quaggans returns a list of quaggan identifiers, e.g. "hat" and "box".

A single resource, e.g. the "hat" quaggan, can be accessed at /v2/quaggans/hat or /v2/quaggans?id=hat.
Multiple resources, e.g. both the "hat" and "box" quaggans, can be accessed at /v2/quaggans?ids=hat,box.
Some resources accept ids=all to expand all resources at once.

### Paging

The endpoints support paging using the page and page_size query parameters. Specifying a page will automatically expand alls resources. The default page size is 50, the maximum size is currently 200.

When accessing a page, additional HTTP response headers may be available:

X-Page-Size – The size of a page (like the page_size query parameter).
X-Page-Total – The total number of pages.
X-Result-Count – The number of resources on the current page (lower or equal to the page size).
X-Result-Total – The total number of resources.

### Authentication

All of the endpoints which fetch account data require the use of an API key. There are currently two ways to provide an API key along with your request.

Adding the Authorization HTTP header to your request with the value Bearer <API key>.
Adding the parameter ?access_token=<API key> to your request URL.
See API key for a list of the authenticated endpoints and their required permissions.

### Localisation

All of the endpoints which are locale-aware accept a language parameter. There are currently two ways to provide this language parameter along with your request.

Adding the Accept-Language HTTP header with the value of <language>, which also gets set by the browser by default.
Adding the parameter ?lang=<language> to your request URL.
Valid languages are en, es, de, fr and zh. If no language parameter is set, the language defaults to en.
  
## Responses

API requests will return a JSON response body describing the requested content, or error message, if applicable. Additionally, the HTTP response code can be used to determine the state of the response body.

### Success

HTTP 200 will be returned if all of the requested data has been returned.
HTTP 206 will be returned when using the ids parameter if at least one, but not all of the provided IDs are valid.

### Errors

HTTP 403 will be returned if attempting to access an authenticated endpoint without a valid API key, or with a valid API key without the necessary permissions.
HTTP 404 will be returned if an endpoint does not exist, or all of the provided IDs are invalid.


# [Source GW2 API Wiki](https://wiki.guildwars2.com/wiki/API:2)

## GitHub Supporters

 [<img class="avatar" alt="suzyfendrick" src="https://avatars1.githubusercontent.com/u/25371717?s=460&u=34217047bbfd4912909cd5a85959544b6e49cc9f&v=4" width="72" height="72">](https://github.com/suzyfendrick)
