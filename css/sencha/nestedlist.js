﻿Ext.define('ListItem', {
    extend: 'Ext.data.Model',
    config: {
        fields: ['text']
    }
});

var treeStore = Ext.create('Ext.data.TreeStore', {
    model: 'ListItem',
    defaultRootProperty: 'items',
    root: {
        items: [
            {
                text: 'Drinks',
                items: [
                    {
                        text: 'Water',
                        items: [
                            { text: 'Still', leaf: true },
                            { text: 'Sparkling', leaf: true }
                        ]
                    },
                    { text: 'Soda', leaf: true }
                ]
            },
            {
                text: 'Snacks',
                items: [
                    { text: 'Nuts', leaf: true },
                    { text: 'Pretzels', leaf: true },
                    { text: 'Wasabi Peas', leaf: true  }
                ]
            }
        ]
    }
});

Ext.create('Ext.NestedList', {
    fullscreen: true,
    store: treeStore
});