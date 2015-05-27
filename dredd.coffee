hooks = require 'hooks'

token = "abcdef"

console.log "This is my token: " + token
hooks.beforeEach (transaction) ->
  transaction.request.headers['Authorization'] = "Bearer " + token
