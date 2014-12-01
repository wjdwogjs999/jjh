<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1. skin -->
<link rel="stylesheet" href="//releases.flowplayer.org/5.5.0/skin/minimalist.css">
<!-- 2. jquery library -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 3. flowplayer -->
<script src="flowplayer/flowplayer-3.2.13.min.js"></script>
</head>
<body>
	<div id="player" style="width: 700px;height: 600px"></div>
<script>
$(document).ready(function(){
	initPlayer();
});
var seekTime = 0; // 이어보기 할 시간을 저장
function initPlayer() {
	flowplayer("player",  "http://releases.flowplayer.org/swf/flowplayer-3.2.18.swf", {
		/* log: { level: 'debug', filter: 'org.flowplayer.captions.*' }, */
		clip: {
			provider: 'pseudo',
		    url: '../storage/ssam.mp4',
			autoPlay: false, // 자동 시작 아님
			onStart: function() {
				if (seekTime > 0) {  // 이어보기 시간이 0보다 크면
					$f("player").seek(seekTime); // seek 이용 시간 이동
				}
			} 
		}, 
		plugins:  {
			pseudo: {
	            url: "flowplayer.pseudostreaming-3.2.13.swf"
	        },
			controls: {
				url: "flowplayer/flowplayer.controls-3.2.16.swf"
			}
		}
	});
	setTimeout(function() {
		if(${inheritTime}==$f("player").getTime()){
			$f("player").play(); // 첨보는 영상이면 바로 플레이
			return;
		}
		seek();
	},1000);
	setInterval(function(){
		opener.document.all.time.value= $f("player").getTime();
	},1000);
}
function seek() {
	if (!${aleadyViewed}) { // aleadyViewed는 처음 보는 영상인지의 여부를 보관
		$f("player").play(); // 첨보는 영상이면 바로 플레이
		return;
	}
	if(confirm("이어보시겠습니까??")) { // 이미 시청했다면
		seekTime = ${inheritTime}; // 시청한 시간을 seekTime으로 지정
	}
	$f("player").play();
} 
</script>

</body>
</html>