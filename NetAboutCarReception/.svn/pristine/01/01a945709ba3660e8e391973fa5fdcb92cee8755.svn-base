/**
 * 手机验证码
 * author：hjw
 */

(function(win, $, undefined){
	if(!(win && $))
		throw "can not find jquery";
	
	var _phoneChecker = function(codeElement, linkElement, url, extra){
		if(!(this instanceof _phoneChecker))
			return new _phoneChecker(codeElement, linkElement, url, extra);
		
		this.ce = codeElement;
		this.le = linkElement;
		this.url = url;
		this.flag = false;
		this.ex = extra;
		
		this.init();
	};
	
	_phoneChecker.prototype.init = function(){
		var _that = this;
		this.le.attr("href", "javascript:void(0);");
		this.le.html("获取验证码");
		this.le.addClass("get_code");
		this.le.on("click", function(){
			_that.getCode(60);
		});
	};
	
	_phoneChecker.prototype.bindCallback = function(cb){
		this.cb = cb;
		return this;
	};
	
	_phoneChecker.prototype.reset = function(){
		clearTimeout(this.timeout);
		this.flag = false;
		this.le.html("获取验证码");
		return this;
	};
	
	_phoneChecker.prototype._timer = function(interval){
		var _that = this;
		if(interval > 0){
			this.le.html(interval + "秒后重新发送");
			this.timeout = setTimeout(function(){
				_that._timer(--interval);
			}, 1000);
		}else{
			this.reset();
		}
	};
	
	
	_phoneChecker.prototype.bindValidate = function(fun){
		if(fun instanceof Function)
			this.validate = fun;
		
		return this;
	};
	
	_phoneChecker.prototype.bindSetup = function(fun){
		if(fun instanceof Function)
			this.setup = fun;
		
		return this;
	};
	
	_phoneChecker.prototype.getCode = function(interval){
		var _that = this;
		if(!this.flag){
			if(this.validate && !this.validate.call(this, this.ce))
				return;
			
			this.flag = true;
			this._timer(interval);
			
			var opt = $.extend({stupaperid : (this.ce && this.ce.val()) || ""}, (this.setup && this.setup.call(this)) || {});
			$.ajax({
		 		type: "post",
		 		url: this.url,
				data: opt,
				async: false,  
		 		dataType: "json",
		 		success: function(data){
			 		if(_that.cb){
			 			_that.cb.call(_that, data);
			 		}else{
			 			_that.reset();
			 		}
				}
			});
		}
		
		return this;
	};
	
	win.PhoneChecker = _phoneChecker;
}(window, jQuery));