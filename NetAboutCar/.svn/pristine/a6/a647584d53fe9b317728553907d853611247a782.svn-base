
function handle_side_menu(){
	$("#menu-toggler").on("click",function(){
		$("#sidebar").toggleClass("display");
		$(this).toggleClass("display");
		return false
		}
	);
	var a=false;
	$(".nav-list .dropdown-toggle").each(function(){
		var b=$(this).next().get(0);
		$(this).on("click",function(){if(a){
			return false
		}
		var d = $(b.parentNode).closest('ul');
		d.find('> .open > .sec').each(function () {
			if(this!=b&&!$(this.parentNode).hasClass("active")){
				$(this).slideUp(200).parent().removeClass("open");
			}
		});
		$(b).slideToggle(200).parent().toggleClass("open");return false})
		}
	)
}

//菜单缩放
$("#sidebar-collapse").on("click",function(){
	  $("#sidebar").toggleClass("menu-min");
	  $(this.firstChild).toggleClass("icon-double-angle-right");
	  a=$("#sidebar").hasClass("menu-min");
	  document.cookie="hasMenu="+a+";";
	 if(a){$(".open > .submenu").removeClass("close")}
	  }
);