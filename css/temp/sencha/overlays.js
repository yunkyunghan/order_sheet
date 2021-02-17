Ext.setup({    
    onReady: function() {
      var overlayTb = new Ext.Toolbar({
          dock: 'bottom'
      });
      
      var overlay = new Ext.Panel({
          floating: true, 
          modal: true, 
          width: 300,
          height: 480,
          dockedItems: overlayTb,
          scroll: 'vertical',
          contentEl: 'lipsum',
          styleHtmlContent: true  
      });

      var showOverlay = function(btn, event) {
          overlay.setCentered(false);
          overlayTb.setTitle('Attached Overlay');
          overlay.showBy(btn);
      };
      
      var showCenteredOverlay = function(btn, event) {
          overlay.setCentered(true);
          overlayTb.setTitle('Centered Overlay');
          overlay.show();
      };       
      
      var dockedItems = [{
          dock: 'bottom',
          xtype: 'toolbar',
          items: [{
              text: 'showBy',
              handler: showOverlay
          }, {
              text: 'show (centered)',
              handler: showCenteredOverlay
          }]
      }];            
                        
      new Ext.Panel({
        fullscreen: true,
        dockedItems: dockedItems
      });
    }
});

