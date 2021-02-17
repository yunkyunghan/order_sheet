
Ext.setup({
  onReady: function(){ 
var panel;       
    new Ext.TabPanel({
     fullscreen: 'true',   
     layout: 'card',
     cardSwitchAnimation: 'slide',
    
   defaults: {
		scrollable: true
	},
        
   items: [
        {
          title: '설교',
          scroll: 'vertical',
          contentEl: 'htmlElement1'
       },
        {
          title: '찬양',
          scroll: 'vertical',
          contentEl: 'htmlElement2'
        },
        {
          title: '소식',
          scroll: 'vertical',
          contentEl: 'htmlElement3'
        },
          {
          title: '묵상',
          scroll: 'vertical',
          contentEl: 'htmlElement4'
        },

{
          title: '안내',
          scroll: 'vertical',
          contentEl: 'htmlElement5'
        },

      ]      
    });     
  }
});

 
 Ext.define('MyApp.controller.Products', {
    extend: 'Ext.app.Controller',

    config: {
        routes: {
            'products/:id': 'showProduct'
        }
    },

    showProduct: function(id) {
        console.log('showing product ' + id);
    }
});                       


