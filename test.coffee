http = require "http"
agent = http.globalAgent
agent.maxSockets = 1000

Client = require "patchboard-client"

class Test
  
  constructor: (options,callback) ->
    @url = options.service.url
    Client.discover @url, (error,@client) =>
      callback error,@client
      
    
  run: (callback) ->
    @client.resources.events.log_event
      content: [{
        name: "test-event"
        origin: "tests"
        timestamp: Date.now()
        data: {foo: "bar"}
      }]
      on:
        response: (response) =>
          if response.status is 202
            callback null,true
          else
            callback new Error "Unexpected response: #{response.status}"
          
        error: (response) =>
          callback new Error "Unexpected error response: #{response.status}"
        
        timeout: =>
          callback new Error "Unexpected timeout"
          
        request_error: (error) =>
          callback error
          
      
    
  
module.exports = Test
  
