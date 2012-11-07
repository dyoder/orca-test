Client = require "patchboard-client"

class Test
  
  constructor: (options) ->
    @url = option.service.url
    
  run: (callback) ->
    Client.discover @url, callback
    
  
module.exports = Test
  