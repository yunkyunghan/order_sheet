Ext.setup({
  onReady: function(){        
    new Ext.TabPanel({
      fullscreen: true,   
      scroll: 'vertical',     
 
 
         
   defaults: {
		scrollable: true
	},
        
   items: [
        {
          title: '�ҽ�',
          scroll: 'vertical',
          contentEl: 'htmlElement3'
       },


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


 

