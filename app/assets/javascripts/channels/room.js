
document.addEventListener('turbolinks:load', function(){
    App.room = App.cable.subscriptions.create({ channel: 'RoomChannel', room: $('#messages').data('room_id') },{
      connected: function() {
      console.log('connected')
      // Called when the subscription is ready for use on the server
    },



    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(message) {
      $('#messages ul').prepend(message['message'])
      $("#messages > ul > li:nth-child(11)").remove();
    
    },

    speak: function(content) {
      console.log(content)
      return this.perform('speak', {message: content});
    }
  });


  const input = document.getElementById('chat-input')
  const button = document.getElementById('button')
  if(input && button){
    button.addEventListener('click', function(){
      const content = input.value
      App.room.speak(content)
      input.value = ''
    })    
  }
})