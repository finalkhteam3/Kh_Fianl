<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='resources/fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
    <script src='resources/fullcalendar-5.11.3/lib/main.js'></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      events : [
          {
          title: 'asd',
          start: '2023-01-31'
          },
          {
          title: 'asdf',
          start: '2023-02-01',
          end: '2023-02-03'
          }
      ]
      });
    calendar.render();
    });
	
  </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
  
</html>