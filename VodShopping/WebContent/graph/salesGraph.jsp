<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="../jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../jquery/highcharts.js"></script>
<script type="text/javascript" src="../jquery/highcharts-more.js"></script>
<script type="text/javascript" src="../jquery/exporting.js"></script>
<script type="text/javascript">
function monthlySales() {	
	$.ajax({
		url:'/VodShopping/main/monthlySalesListGet.do',
		type:'POST',
		dataType:'json',
		success:function(result){
			$('#container').highcharts({
		        title: {
		            text: '월별 매출액'
		        },
		        xAxis: {
		            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		        },
		        yAxis:{
		        	title: {
		                text: ''
		            },
		            min : 0
		        },
		        tooltip: {
		        	xDateFormat: '%Y-%m-%d',
		            shared: true , 
		            style: {
		                padding: 40, 
		                fontWeight: 'bold'
		            },
		            valueSuffix: '원'
		        },
		        series: [{
		        	name : "2013년 매출",
		            data: eval("["+result.finalValue[0].obj1+"]")},{
		            name : "2014년 매출",
		            data: eval("["+result.finalValue[0].obj2+"]")
		        }]
		    });
		}//success
		,
		error:function(request, status, error){
			alert("code = "+request.status+"\n message : "+request.responseText+"\n error = "+error);
		}
	});//ajax
}

function generationButCount(){
	$.ajax({
		url:'/VodShopping/main/buyCountByGeneration.do',
		type:'POST',
		dataType:'json',
		success:function(result){
			$('#container').highcharts({
				 chart: {
			            plotBackgroundColor: null,
			            plotBorderWidth: 1,//null,
			            plotShadow: false
			        },
			        title: {
			            text: '세대별구매횟수'
			        },
			        tooltip: {
			            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			        },
			        plotOptions: {
			            pie: {
			                allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: true,
			                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
			                    style: {
			                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
			                    }
			                }
			            }
			        },
			        series: [{
			            type: 'pie',
			            name: 'Browser share',
			            data: [
			                ['10대',  result[0] ],
			                ['20대',  result[1] ],
			                {
			                    name: '30대',
			                    y: result[2],
			                    sliced: true,
			                    selected: true
			                },
			                ['40대',   result[3] ],
			                ['50대',   result[4] ],
			                ['60대',   result[5] ]
			            ]
			        }]
		    });
		}//success
	});//ajax
}
</script>
<div style="width: 700px; margin: 20px; height: 100%;">
	<div style="height: 100px;">
		<input type="button" onclick="monthlySales()" value="월별매출현황보기" >
		<input type="button" onclick="generationButCount()" value="연령별구매비율보기" >
	</div>
	<div id="container" style="width: 660px;"></div>
</div>