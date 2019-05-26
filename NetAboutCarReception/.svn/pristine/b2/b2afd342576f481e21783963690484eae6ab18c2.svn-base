function init(){
	$.ajax({
		url:basePath+'announcement/driver/pun/list.action',
		dataType:'json',
		type:'post',
		success:function(response){
			for(var i=0;i<response.length;i++){
				var li=$('<li>').appendTo('.announcement');
				$('<i class="fa fa-circle"></i>').appendTo(li);
				$('<a>').appendTo(li).html('驾驶员'+response[i].punText+'处分公示').addClass('info_index').attr('href','javscript:void(0);')
					.attr('list-no',response[i].listNo)
					.click(function(){
						var listNo=$(this).attr('list-no');
						$("#main").load(basePath+'announcement/driver/pun/detail.action?listNo='+listNo, function() {
							
						});
					});
				$('<span>').appendTo(li).html(moment(response[i].pubDate.time).format('YYYY-MM-DD')).addClass('info_time');
			}
		}
	});
	
}

init();