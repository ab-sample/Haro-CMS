<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>汉诺 | 大连</title>
	<%@ include file="/WEB-INF/pages/common/common.jsp"%>

    <script type="text/javascript" src="/static/js/common/validation/ValidationTools.js"></script>
    <script type="text/javascript" src="/static/js/common/file/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="/static/js/common/file/jquery.fileupload.js"></script>
    <script>
        $(function(){
            $('#photoNameUpload').fileupload({
                url: _basePath + "file/imageUpload",
                dataType: 'json',
                done: function(e, data){
                    $("#photoFile").attr("src", _basePath+"file/show?id="+data.result.id+"&fileType="+data.result.fileType);
                    $("#photoFile").show('normal');
                    $("#coverPhotoName").val(data.result.id);
                    $("#coverPhotoType").val(data.result.fileType);
                }
            });
        });
        function save(){
            if ($('#entityForm').valid() && $("#insFlg").val() == "0") {
                $("#insFlg").val("1");
                ajaxSubmit({
                    url : "/partner/project/save",
                    form : "entityForm",
                    onSuccess : function(data, textStatus) {
                        if ("1" == data) {
                            $.dialog.tips('保存成功！', 1, 'succ.png');
                        } else {
                            $.dialog.tips('保存失败， 请稍后再试！', 1, 'fail.png');
                        }
                        $("#insFlg").val("0");
                    },
                    onError : function(req) {
                        $.dialog.tips('保存失败， 请稍后再试！', 1, 'fail.png');
                        $("#insFlg").val("0");
                    },
                    maskId : "container"
                });
            }
        }
    </script>
</head>
<body>
	<div id="breadCrumb" style="display:none">
        <a href="#">HN</a>
        >>
        合作伙伴
        >>
        示范工程
        >>
        添加
	</div>
	<div id="container" class="popBox-out">
		<div class="popBox-in">
			<form id="entityForm" name="entityForm">
                <input type="hidden" id="insFlg" value="0" />
				<div class="pdT10 pdR10 pdB10 pdL10">
					<div class="bdr-dashed-blue enterInfo-box">
						<h3 class="tit fb">基本信息</h3>
						<table width="100%">
							<tbody>
							<tr>
								<td class="w302 tr pdR10"><span class="mark-must">*</span>
                                    名称：</td>
								<td><input type="text" class="valBox fl" id="name"
										   maxlength="100" name="name" valid="{required:true,maxlength:100}" /></td>
							</tr>
                            <tr>
                                <td class="w302 tr pdR10">
                                    封面图片：</td>
                                <td>
                                    <input id="photoNameUpload" type="file" name="file" >
                                    <input id="coverPhotoName" type="hidden" name="coverPhotoName" >
                                    <input id="coverPhotoType" type="hidden" name="coverPhotoType" >
                                    <img id="photoFile" src="" style="width:328px;height:238px;display: none; " />
                                </td>
                            </tr>
							</tbody>
						</table>
					</div>
					<div class="subBar tc">
						<ul class="clearfix">
							<li class="fl"><a class="btn-a-1" href="###" onclick="save();"><span>保存</span></a></li>
							<li class="fl"><a class="btn-a-1" href="/partner/project/list"><span>返回</span></a></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>