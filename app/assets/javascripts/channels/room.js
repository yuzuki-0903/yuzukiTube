App.room = App.cable.subscriptions.create("RoomChannel",{


connected: function() {
    console.log('connected')
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(message) {
    $("#messages > ul").prepend(message)
    $("#messages > ul > li:nth-child(11)").remove()
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(content) {
    return this.perform('speak', {message: content});
  }
});

document.addEventListener('DOMContentLoaded', function(){
  const input = document.getElementById('chat-input')
  const button = document.getElementById('button')
  button.addEventListener('click', function(){
    const content = input.value
    App.room.speak(content)
    input.value = ''
  })
})
