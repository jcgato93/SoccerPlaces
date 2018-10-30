$(function() {

    // page is now ready, initialize the calendar...
  
    $('#calendar').fullCalendar({
        lang: 'es',
        dayClick: function(date, jsEvent, view) {
      
        //   alert('Clicked on: ' + date.format());
      
        //   alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
      
        //   alert('Current view: ' + view.name);
      
        let isToday= moment();

        if(isToday.format('YYYY-MM-DD') > date.format('YYYY-MM-DD')){
           alert("No Se pueden realizar reservas de dias anteriores");           
        }else{
          // change the day's background color just for fun
          $(this).css('background-color', 'red');
          var canchaId= $.getQuery('soccer_court_id')
          //window.location.href=`/reservations/getreservations/get?id=${canchaId}&date=${date.format()}`
          window.location.href=`/reservations/new?soccer_court_id=${canchaId}&date=${date.format()}`
        }
        }
      });
      
    
   
});
  
// Parse URL Queries Method
(function($){
    $.getQuery = function( query ) {
        query = query.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
        var expr = "[\\?&]"+query+"=([^&#]*)";
        var regex = new RegExp( expr );
        var results = regex.exec( window.location.href );
        if( results !== null ) {
            return results[1];
            return decodeURIComponent(results[1].replace(/\+/g, " "));
        } else {
            return false;
        }
    };
})(jQuery);



    
