Ext.setup({
  onReady: function(){        
    var item1 = {         
      style: "background-color:red;",
      html: 'Item1'
    };
    var item2 = { 
      style: "background-color:gray;",
      html: 'Item2'
    };
    var item3 = {   
      style: "background-color:yellow;",
      html: 'Item3'
    };
      
    var panel = new Ext.Carousel({
          fullscreen: true,  
          ui: 'dark', 
          indicator: true,
 direction: 'horizontal',
          items: [item1,item2,item3]
      });      
  }
});

