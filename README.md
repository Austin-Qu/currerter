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
{"amount":35328.84,"fixer_code":200,"status":"ok"}
```
