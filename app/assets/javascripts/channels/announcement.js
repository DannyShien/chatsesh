App.announcement = App.cable.subscriptions.create("AnnouncementChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log('#announcement connected', this);
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('#announcement received:', data);
    $(".navbar").after(data.html)
  }
});
