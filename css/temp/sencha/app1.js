Ext.application({
    name: 'Sencha',

    launch: function() {
        Ext.create("Ext.tab.Panel", {
            fullscreen: true,
            items: [
                {
                    title: 'Home',
                    iconCls: 'home',
                    html: '<meta http-equiv="refresh" content="1;url=scm_data/default.aspx">'
                }
            ]
        });
    }
});

 
 