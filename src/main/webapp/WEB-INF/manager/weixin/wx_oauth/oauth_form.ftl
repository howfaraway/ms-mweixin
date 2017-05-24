<@ms.html5>
	 <@ms.nav title="权限信息编辑" back=true>
    	<@ms.saveButton  onclick="save()"/>
    </@ms.nav>
    <@ms.panel>
    	<@ms.form name="oauthForm" isvalidation=true>
    		<@ms.text label="微信编号:" name="oauthWeixinId" value="${wxOauthEntity.oauthWeixinId?default('')}" width="240px;" placeholder="请输入微信编号" validation={"required":"true","maxlength":"50","data-bv-stringlength-message":"微信编号长度不能超过五十个字符长度!", "data-bv-notempty-message":"必填项目"}/>
    		<@ms.hidden name="oauthId" value="${wxOauthEntity.oauthId?default('')}"/>
    		<@ms.text label="用户编号:" name="oauthAppId" value="${wxOauthEntity.oauthAppId?default('')}" width="240px;" placeholder="请输入用户编号" validation={"required":"true","maxlength":"50","data-bv-stringlength-message":"用户编号长度不能超过五十个字符长度!", "data-bv-notempty-message":"必填项目"}/>
    		<@ms.text label="授权成功地址:" name="oauthSuccessUrl" value="${wxOauthEntity.oauthSuccessUrl?default('')}" width="240px;" placeholder="请输入授权成功地址" validation={"required":"true","maxlength":"50","data-bv-stringlength-message":"授权成功的地址长度不能超过五十个字符长度!", "data-bv-notempty-message":"必填项目"}/>
    		<@ms.text label="授权失败地址:" name="oauthErrorUrl" value="${wxOauthEntity.oauthErrorUrl?default('')}" width="240px;" placeholder="请输入授权失败地址" validation={"required":"true","maxlength":"50","data-bv-stringlength-message":"授权失败的地址长度不能超过五十个字符长度!", "data-bv-notempty-message":"必填项目"}/>
    		<@ms.text label="权限描述:" name="oauthDescription" value="${wxOauthEntity.oauthDescription?default('')}" width="240px;" placeholder="请输入对应的权限描述" validation={"required":"true","maxlength":"50","data-bv-stringlength-message":"权限描述长度不能超过五十个字符长度!", "data-bv-notempty-message":"必填项目"}/>
    		<@ms.select name="oauthType" label="权限类型:" list=os  value="" listKey="key" listValue="Value" width="240"/>
    	</@ms.form>
    </@ms.panel>
</@ms.html5>
<script>
	var url = "${managerPath}/weixin/wxOauth/save.do";
	if($("input[name = 'oauthId']").val() > 0){
		url = "${managerPath}/weixin/wxOauth/update.do";
		$(".btn-success").text("更新");
	}
	//编辑按钮onclick
	function save() {
		$("#oauthForm").data("bootstrapValidator").validate();
			var isValid = $("#oauthForm").data("bootstrapValidator").isValid();
			if(!isValid) {
				<@ms.notify msg= "数据提交失败，请检查数据格式！" type= "warning" />
				return;
		}
		var btnWord =$(".btn-success").text();
		$(".btn-success").text(btnWord+"中...");
		$(".btn-success").prop("disabled",true);
		$.ajax({
			type:"post",
			dataType:"json",
			data:$("form[name = 'oauthForm']").serialize(),
			url:url,
			success: function(status) {
				if(status.result == true) { 
					<@ms.notify msg="保存或更新成功" type= "success" />
					location.href = "${managerPath}/weixin/wxOauth/index.do";
				}
				else{
					<@ms.notify msg= "保存或更新失败！" type= "fail" />
					location.href= "${managerPath}/weixin/wxOauth/index.do";
				}
			}
		})
	}	
</script>