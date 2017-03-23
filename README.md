# Currertor API

A RoR API consumes API from fixer.io for converting currencies.

## Endpoints

```ruby
POST /api/v1/converter/convert
```

|Field   |Type         |Description                  |
|--------|-------------|-----------------------------|
|amount  |Number       |currency amount              |
|base    |String       |origin currency              |
|symbols |String       |target currency              |

Response example:

```json
{"base":"AUD","date":"2017-03-22","rates":{"USD":0.76722},"converted_amount":306.88800000000003}
```
