
document.addEventListener('turbolinks:load', function(){
    if(App.room != undefined){
      App.room.unsubscribe(); 
    }
    
    App.room = App.cable.subscriptions.create({ channel: 'RoomChannel', room: $('#messages').data('room_id') },{
      connected: function() {
        this.cable = window.ActionCable.createConsumer();
        this.cable.subscriptions.create('RoomChannel', this.sessionChannelCallback);
      console.log('connected')
      // Called when the subscription is ready for use on the server
    },



    disconnected: function() {
      console.log('disconnected')
      // Called when the subscription has been terminated by the server
    },

    received: function(message) {
      console.log(message)
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
