Client = require "patchboard-client"

class Test
  
  constructor: (options) ->
    @url = options.service.url
    
  run: (callback) ->
    Client.discover @url, callback
    
  
module.exports = Test
  