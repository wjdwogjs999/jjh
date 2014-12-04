Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.panel.*',
    'Ext.toolbar.*',
    'Ext.layout.container.Border'
]);
var startIndex=0;
var endIndex=10;

//Ext Js로 공지사항 뿌려줌
Ext.onReady(function(){	
	var el = Ext.get('display');
	
	Ext.define('Info',{
		extend : 'Ext.data.Model',
		fields : [{
			name:'infoCode',
			type:'int'
		},{
			name:'infoSubject'
		},{
			name:'logtime'
		},{
			name:'hit',
			type:'int'
		}]
	})
	
	store = Ext.create('Ext.data.Store',{
		autoLoad:{start:0,limit:10},
		model:'Info',
		pageSize:10,
		proxy:{
			type:'ajax',
			url:'/VodShopping/info/infoListGet.do',
			reader:{
				type: 'json',
	            rootProperty: 'data',
	            totalProperty: 'total'
			}
		}
	});
	myFormPanel=Ext.create('Ext.grid.Panel', {
		renderTo: 'display',
	    store: store,
	    width: 700,
	    title: '공지사항',
	    columns: [
	              {text: "infoCode", flex: 2, dataIndex: 'infoCode', sortable: true},
	              {text: "infoSubject", flex: 4, dataIndex: 'infoSubject', sortable: true},
	              {text: "logtime", flex: 2, dataIndex: 'logtime', sortable: true},
	              {text: "hit", flex: 1, dataIndex: 'hit', sortable: true}
	    ],
	    dockedItems: [{
	        xtype: 'pagingtoolbar',
	        store: store,   // same store GridPanel is using
	        dock: 'bottom',
	        displayInfo: true
	    }]
	});
	
	// update panel body on selection change
	myFormPanel.getSelectionModel().on('selectionchange', function(sm, selectedRecord) {
        location.href="/VodShopping/info/infoView.do?infoCode="+selectedRecord[0].data.infoCode+"&hit="+(selectedRecord[0].data.hit+1);        
    });
});
//공지수정
function infoModify(seq){
	window.open("/VodShopping/info/infoModifyForm.do?infoCode="+seq, "", "width=850 height=620 left=200 top=100");
}
//공지삭제
function infoDelete(seq){
	location.href="/VodShopping/info/infoDelete.do?infoCode="+seq;
}
