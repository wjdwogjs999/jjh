Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.panel.*',
    'Ext.layout.container.Border'
]);
var startIndex=0;
var endIndex=10;

Ext.onReady(function(){
	$('#paging').hide();
	
	Ext.define('Info',{
		extend : 'Ext.data.Model',
		proxy: {
            type: 'ajax',
            reader: 'json'
        },
		fields : [{
			name:'infoCode',
			type:'int'
		},{
			name:'infoSubject'
		},{
			name:'logtime'
		}]
	})
	
	store = Ext.create('Ext.data.Store',{
		model:'Info',
		proxy:{
			type:'ajax',
			url:'/VodShopping/info/infoListGet.do?startParam=0&limitParam=10'
		}
	});
	
	myFormPanel=Ext.create('Ext.grid.Panel', {
		bufferedRenderer: false,
	    store: store,
	    width: 700,
	    title: '공지사항',
	    columns: [
	              {text: "infoCode", flex: 2, dataIndex: 'infoCode', sortable: true},
	              {text: "infoSubject", flex: 4, dataIndex: 'infoSubject', sortable: true},
	              {text: "logtime", flex: 3, dataIndex: 'logtime', sortable: true}
	    ],
	    forceFit: true,
        split: true,
        region: 'north'
	});
	

	// define a template to use for the detail view
    tplMarkup = [
       "<div style='padding:20px; margin:10px 0px;'>" +
       "<div style='display:table; width:655px'>" +
		 	"<div class='infoview_table_sub_raw'>"+
				"<div class='infoview_cell' style='font-weight:bold; float:left; font-size:16px; width:50%;'>"+
					"공지번호 : {infoCode}"+
				"</div>"+
				"<div class='infoview_cell' style='width:50%; margin-top:3px; float:right'>"+
					"<b>공지등록일</b> : {logtime}"+
				"</div>"+
			"</div><br/><br/><br/>"+
			"<br/>"+
			"<div class='infoview_content'>"+
				"<h5>공지내용</h5><br/>{infoContent}"+
			"</div>"+
		"</div>"+
		"<div style='padding:10px; float:left; text-align:left;'>"+
		"</div>"+
		    "<div style='float: right; margin-top:10px;'>"+
		    	"<input type='button' value='수정' onclick='javascript:infoModify({infoCode})'>"+
		    	"<input type='button' value='삭제' onclick='javascript:infoDelete({infoCode})'>"+
		    "</div>"+
		"</div>"
    ];
    var tpl = Ext.create('Ext.Template', tplMarkup);
	
    Ext.create('Ext.Panel', {
        renderTo: 'display',
        frame: true,
        title: '공지사항',
        width: 700,
        height: 800,
        layout: 'border',
        items: [
            myFormPanel, {
                id: 'detailPanel',
                region: 'center',
                bodyPadding: 7,
                bodyStyle: "background: #ffffff;",
                html: '공지내용'
        }]
    });
    
    // update panel body on selection change
    myFormPanel.getSelectionModel().on('selectionchange', function(sm, selectedRecord) {
        if (selectedRecord.length) {
            var detailPanel = Ext.getCmp('detailPanel');
            detailPanel.update(tpl.apply(selectedRecord[0].data));
        }
    });
	store.load();
	$('#paging').show();
});

$(document).ready(function(){
	makePagingHTML($('#pg').val(),5,10,$('#tot').val());
});

function infoModify(seq){
	window.open("/VodShopping/info/infoModifyForm.do?infoCode="+seq, "", "width=850 height=620 left=200 top=100");
}
function infoDelete(seq){
	location.href="/VodShopping/info/infoDelete.do?infoCode="+seq+"&pg=1";
}
function makePagingHTML(pg, pageBlock, pageSize,totalA){
	var totalP=(totalA+pageSize-1)/pageSize;
	var startPage=(parseInt((pg-1)/pageBlock))*pageBlock+1;
	var endPage=startPage+pageBlock-1;
	if(endPage>totalP){
		endPage=totalP;
	}
	$('#paging').html("");
	if(startPage>pageBlock){
		$('#paging').append("<a href='#' onclick='makePagingHTML("+(startPage-1)+','+pageBlock+','+pageSize+','+totalA+")'>이전</a>&nbsp;&nbsp;");
	}
	for(var i=startPage;i<=endPage;i++){
		if(pg==i){
			$('#paging').append("<b>["+i+"]</b>&nbsp;&nbsp;");
		}else{
			$('#paging').append("<a href='#' onclick='makePagingHTML("+i+','+pageBlock+','+pageSize+','+totalA+")'>["+i+"]</a>&nbsp;&nbsp;");
		}
	}
	if(endPage<totalP){
		$('#paging').append("<a href='#' onclick='makePagingHTML("+(startPage+pageBlock)+','+pageBlock+','+pageSize+','+totalA+")'>다음</a>");
	}
	///////////////////////////여기서 부터 다시 그리기
	$('#display').html("");
	var endIndex = 10;
	var startIndex = pg*endIndex-10;
	store = Ext.create('Ext.data.Store',{
		model:'Info',
		proxy:{
			type:'ajax',
			url:'/VodShopping/info/infoListGet.do?startParam='+startIndex+'&limitParam='+endIndex
		}
	});
	myFormPanel=Ext.create('Ext.grid.Panel', {
		bufferedRenderer: false,
	    store: store,
	    width: 700,
	    title: '공지사항',
	    columns: [
	              {text: "infoCode", flex: 2, dataIndex: 'infoCode', sortable: true},
	              {text: "infoSubject", flex: 4, dataIndex: 'infoSubject', sortable: true},
	              {text: "logtime", flex: 3, dataIndex: 'logtime', sortable: true}
	    ],
	    forceFit: true,
        split: true,
        region: 'north'
	});
    var tpl = Ext.create('Ext.Template', tplMarkup);
	
    Ext.create('Ext.Panel', {
        renderTo: 'display',
        frame: true,
        title: '공지사항',
        width: 700,
        height: 800,
        layout: 'border',
        items: [
            myFormPanel, {
                id: 'detailPanel',
                region: 'center',
                bodyPadding: 7,
                bodyStyle: "background: #ffffff;",
                html : "공지내용"
        }]
    });
    
    // update panel body on selection change
    myFormPanel.getSelectionModel().on('selectionchange', function(sm, selectedRecord) {
        if (selectedRecord.length) {
            var detailPanel = Ext.getCmp('detailPanel');
            detailPanel.update(tpl.apply(selectedRecord[0].data));
        }
    });
    store.load();
}