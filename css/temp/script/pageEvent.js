$(document).bind("mobileinit", function(){
  //Page1에 대한 페이지 이벤트
  $('#home').live('pagecreate',function(event){
    $(this).find('#homePageInfo').append('<strong>pagecreate</strong><br />'); 
  });   
  $('#home').live('pagebeforecreate',function(event){
    $(this).find('#homePageInfo').append('<strong>pagebeforecreate<br />'); 
  });
  $('#home').live('pagebeforeshow',function(event, ui){
    $(this).find('#homePageInfo').append('<strong>pagebeforeshow</strong><br />');       
  });    
  $('#home').live('pageshow',function(event, ui){
    $(this).find('#homePageInfo').append('<strong>pageshow</strong> (prevPage: ' + ui.prevPage.attr("data-url") + ')<br />');       
  });  
  $('#home').live('pagebeforehide',function(event, ui){
    $(this).find('#homePageInfo').append('<strong>pagebeforehide</strong><br />');  
  });
  $('#home').live('pagehide',function(event, ui){
    $(this).find('#homePageInfo').append('<strong>pagehide</strong> (nextPage: ' + ui.nextPage.attr("data-url") + ')<br />');    
  });  
            
  //Page2에 대한 페이지 이벤트     
  $('#secondPage').live('pagecreate',function(event){
    $(this).find('#secondPageInfo').append('<strong>pagecreate</strong><br />');   
  });   
  $('#secondPage').live('pagebeforecreate',function(event){
    $(this).find('#secondPageInfo').append('<strong>pagebeforecreate<br />');     
  });    
  $('#secondPage').live('pagebeforeshow',function(event, ui){    
    $(this).find('#secondPageInfo').append('<strong>pagebeforeshow</strong><br />'); 
  });    
  $('#secondPage').live('pageshow',function(event, ui){
    $(this).find('#secondPageInfo').append('<strong>pageshow</strong> (prevPage: ' + ui.prevPage.attr("data-url") + ')<br />');       
  });  
  $('#secondPage').live('pagebeforehide',function(event, ui){    
    $(this).find('#secondPageInfo').append('<strong>pagebeforehide</strong><br />');    
  });
  $('#secondPage').live('pagehide',function(event, ui){
    $(this).find('#secondPageInfo').append('<strong>pagehide</strong> (nextPage: ' + ui.nextPage.attr("data-url") + ')<br />');       
  });                
});
