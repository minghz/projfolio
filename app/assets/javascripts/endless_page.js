//This miserable attempt at creating an endless page
//scroll has failed.
//Althoug, there are some nice notes on how 
//AJAX calls work
//
//The working code for this is in one of the coffee scripts

//var currentPage = 1;
//
//function checkScroll() {
//  if (nearBottomOfPage()) {
//    currentPage++;
//    $.ajax(window.location.pathname + '.js?page=' + currentPage);
//  } else {
//    setTimeout("checkScroll()", 250);
//  }
//}
//
//function nearBottomOfPage() {
//  return scrollDistanceFromBottom() < 150;
//}
//
//function scrollDistanceFromBottom(argument) {
//  return $(document).height() - ($(window).height() + $(window).scrollTop());
//}
//
//$(document).ready(function(){ 
//  if ( $(location).attr('pathname') == '/new_posts' ){
//    checkPosition();
//  }
//});
//function checkPosition(){
//  $(window).scroll(function() {
//    
//    var next_page = $('.next_page').attr('href');
//    var at_bottom = $(window).scrollTop()
//                    + $(window).height()
//                    >= $(document).height();
//    if(next_page && at_bottom) {
//      alert("before ajax call" + next_page);
//      var a = $.ajax({
//        url: next_page,
//      })
//      .done(function(data){
//        alert("after ajax call");
//        //var rows = data.filter('#all_posts').html
//        //$('#all_posts').append(rows);
//        $('#all_posts').append(data);
//      });
//    }
//
//  });
//}
