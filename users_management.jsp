<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理--所有用户</title>

<script type="text/javascript">
var oTable=null;
$(function(){
	 initTable(); 
});
//“检索”按钮的处理函数
function initTable() {
	if (oTable == null) { //仅第一次检索时初始化Datatable
		oTable = $('#adminTable')
				.dataTable(
						{
							"bAutoWidth" : false, //不自动计算列宽度
							"bProcessing" : true, //加载数据时显示正在加载信息
							"bServerSide" : false, //指定从服务器端获取数据
							"bSort" : false,
							"bPaginate" : true,
							"bFilter" : false, //不使用过滤功能
							"bLengthChange" : false, //用户不可改变每页显示数量
							"iDisplayLength" : 10, //每页显示8条数据
							"sPaginationType" : "full_numbers", //翻页界面类型
							"sAjaxSource" : "${pageContext.request.contextPath}/ajax/InitAllUserAction.action",//获取数据的url
							"sServerMethod" : "POST",
							"aoColumns" : [
									
									{ //序号
										"mData" : null,
										sClass : "alignCenter",
									},
									
									{ //评估编号
										"mData" : "evalnum",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									{ //调查单位地址
										"mData" : "DCDWAddress",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {
												return 	data; 
											}
										}
									},
									{ //姓名
										"mData" : "name",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									{ //性别
										"mData" : "sex",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									
									{ //身份证号
										"mData" : "idNumber",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									
									{ //年龄
										"mData" : "age",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									
									{ //民族
										"mData" : "nation",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									
									{ //文化程度
										"mData" : "WHCD",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									
									{ //是否离退休
										"mData" : "retire",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									
									{ //职业
										"mData" : "occupation",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									
									{ //长期居住地
										"mData" : "CQJZD",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									{ //现居地
										"mData" : "XJD",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									},
									{ //照料方式
										"mData" : "Care",
										sClass : "alignCenter",
										"mRender" : function(data, type,
												full) {
											if (data == null) {
												return "暂无";
											} else {  
												return  data;
											}
										}
									}
									],
							"fnServerData" : function(sSource, aoData,
									fnCallback) {
								$
										.ajax({
											url : sSource,
											async : true,
											type : "POST",
											dataType : "json",
											"data" : {
												aoData : $.toJSON(aoData),
												RecordType:0,
											},
											contentType : "application/x-www-form-urlencoded; charset=utf-8",
											cache : false,
											success : function(data) {
												if (data.responState = "REQ_SUCCESS") {
													data.responResult = $
															.parseJSON(data.responResult);
													json = data.responResult;
													fnCallback(data);
													
												}
												

											}
										});
							},
							"fnRowCallback" : function(nRow, aData,
									iDisplayIndex, iDisplayIndexFull) {
								var index = iDisplayIndex + 1;
								$('td:eq(0)', nRow).html(index);
								return nRow;
							},
							"fnCreatedRow" : function(nRow, aData,
									iDataIndex) {
								$(nRow).attr('id', iDataIndex);
							},
							"sAjaxDataProp" : "responResult",
							"oLanguage" : {//汉化
								"sLengthMenu" : "每页显示 _MENU_ 条记录",
								"sZeroRecords" : "  ",
								"sInfo" : "当前记录为从第 _START_ 到第 _END_ 条；总共有 _TOTAL_ 条记录",
								"sInfoEmtpy" : "没有数据",
								"sProcessing" : "正在加载数据...",
								"oPaginate" : {
									"sFirst" : "首页",
									"sPrevious" : "上一页",
									"sNext" : "下一页",
									"sLast" : "尾页"
								}
							}
						});
	}
}

//导出用户信息
function exportExcell(){
	var ajaxData;
	if ($('#evalnum').val() != "-1") {
		ajaxData += "&evalnum=" +encodeURI(encodeURI($('#evalnum').val()));
	}
	if ($('#DCDWAddress').val() != "") {
		ajaxData += "&DCDWAddress=" +encodeURI(encodeURI($('#DCDWAddress').val()));
	}
	if ($('#name').val() != "-1") {
		ajaxData += "&name=" +$('#name').val();
	}  
	if ($('#sex').val() != "-1") {
		ajaxData += "&sex=" +$('#sex').val();
	} 
	if ($('#idNumber').val() != "") {
		ajaxData += "&idNumber=" +$('#idNumber').val();
	}
	if ($('#age').val() != "") {
		ajaxData += "&age=" +encodeURI(encodeURI($('#age').val()));
	}
	if ($('#nation').val() != "-1") {
		ajaxData += "&nation=" +$('#nation').val();
	}  
	if ($('#WHCD').val() != "-1") {
		ajaxData += "&WHCD=" +$('#WHCD').val();
	}  
	if ($('#retire').val() != "-1") {
		ajaxData += "&retire=" +$('#retire').val();
	}  
	if ($('#occupation').val() != "") {
		ajaxData += "&occupation=" +$('#occupation').val();
	}
	 if ($('#CQJZD').val() != "-1") {
		ajaxData += "&CQJZD=" +$('#CQJZD').val();
	} 
	 if ($('#XJD').val() != "-1") {
			ajaxData += "&XJD=" +$('#XJD').val();
	}  
	 if ($('#Care').val() != "-1") {
			ajaxData += "&Care=" +$('#Care').val();
	}  
	 location.href = " ${pageContext.request.contextPath}/ajax/ExporUserInfoAction.action?" + ajaxData;
}


</script>
</head>
<body style="overflow-x: hidden;">
	<div id="maincontent2">
		<div id="content2">
			<div class="content_box2">
			<div id="content_box2">
			<div style="position:fixed;right:0;margin-top:15px;margin-bottom:15px;">
			 
			</div>
				<div>
				
					<ul>
						<li>
							<div>
								<div>
									<div>
										<table style="width: 100%; font-size: 13px;padding-right:-20px;margin-top:20px;"
											class="table table-hover" id="adminTable">
											<thead style="font-size: 13px">
											<tr><input type="button" value="导出" style="margin-top:4px;margin-left:1105px"class="btn btn-primary"   onclick="exportExcell()"></tr>
												<tr height="40px">
												
													<th width="5%">序号</th>
													<th width="6%" id="evalnum">评估编号</th>
													<th width="10%" id="DCDWAddress">调查单位地址</th>
													<th width="5%" id="name">姓名</th>
													<th width="5%" id="sex">性别</th>
													<th width="7%" id="idNumber">身份证号</th>
													<th width="6%" id="age">年龄</th>
													<th width="6%" id="nation">民族</th>
													<th width="7%" id="WHCD">文化程度</th>
													<th width="7%" id="retire">是否离退休</th>
													<th width="6%" id="occupation">职业</th>
													<th width="7%" id="CQJZD">长期居住地</th>
													<th width="6%" id="XJD">现居地</th>
													<th width="6%" id="Care">照料方式</th>
												</tr>
											</thead>
											<tbody>
										</table>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>

			</div>
			</div>
		</div>
	</div>
</body>
</html>