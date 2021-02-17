Ext.setup({
    onReady: function() {
        var pnl = new Ext.Panel({
            fullscreen: true,
            layout: {
                type: 'vbox',
                pack: 'center'
            },
            items: [{
                xtype: 'audio',
                url: 'crash.mp3',
                loop: true
            }]            
        })
    }
});
