
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
          title: '����',
          scroll: 'vertical',
          contentEl: 'htmlElement1'
       },
        {
          title: '����',
          scroll: 'vertical',
          contentEl: 'htmlElement2'
        },
        {
          title: '�ҽ�',
          scroll: 'vertical',
          contentEl: 'htmlElement3'
        },
          {
          title: '����',
          scroll: 'vertical',
          contentEl: 'htmlElement4'
        },

{
          title: '�ȳ�',
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


