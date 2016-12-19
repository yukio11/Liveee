$(document).ready(function() {
    $('#calendar').fullCalendar({
      events: '/lives.json',
    })
});