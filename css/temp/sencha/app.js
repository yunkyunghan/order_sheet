Ext.application({
    name: 'Sencha',

    launch: function() {
        Ext.create("Ext.tab.Panel", {
            fullscreen: true,
            tabBarPosition: 'bottom',

            items: [
                {
                    title: 'home',
                    iconCls: 'home',
                    cls: 'home',

                    html: [
                        '<img src="images/20120809_1180.jpg" width=320>',
                        '<meta http-equiv="refresh" content="1;url=index.aspx">' 
                    ].join("")
                }
            ]
        });
    }
});


  
   

 
