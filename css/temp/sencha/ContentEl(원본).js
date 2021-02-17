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
          title: '소식',
          scroll: 'vertical',
          contentEl: 'htmlElement3'
       },


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


 

