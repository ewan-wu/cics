<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="˾���������������">
<table align="left">
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="judicialControl" init="false" submitMode="current">
			<table width="1300px">
				<tr>
					<td colspan="2" valign="top">
						<@CommonQueryMacro.Interface id="interface1" label="�������ѯ����" fieldStr="qbatchNo,qbdhm,qxm,qdsrzjhm,qreqdatebegin,qreqdateend"/>
					</td>
				</tr>
				<tr>
					<td>
						<@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="9" showArrow="true" pageCache="false"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<@CommonQueryMacro.DataTable id="datatable1" paginationbar="btAudit" fieldStr="select,opr,approve,result,filler5,batchNo,bdhm,lb,xz,xm,zjlx,dsrzjhm,fymc,fydm,cbr,yhdh,ah,gzzbh,gwzbh,ckh,ckkssj,ckjssj,wsbh,xchtyy,xchtbz,xchtr,xchtdh" width="100%"/>
					</td>
				</tr>
				<tr>
      				<td colspan="2">
      				<@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="300" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      					<div align="center">
      						<@CommonQueryMacro.Group id="group1" label="�����Ϣ" fieldStr="approveStatusChoose,approveResultChoose" colNm=2/>
        			  		<br />
        					<@CommonQueryMacro.Button id= "btConfirm"/>
        					<@CommonQueryMacro.Button id= "btCancel"/>
      					</div>
     		 		</@CommonQueryMacro.FloatWindow>
  					</td>
  				</tr>
			</table>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
</table>
<script language="JavaScript">
   var _approveStatus = "";
	//��id�б�ɳ�����,��Ҫ��¼����,����˵��,ԭ��¼����,��¼����
	function datatable1_opr_onRefresh(cell, value, record){
		if(record){
			var id = record.getValue("id");			
			innerText = "<center><a href=\"Javascript:void(0);\" onClick=\"Javascript:showDetail('"+id+"')\">��ϸ</a> ";
			innerText = innerText +"<a href=\"Javascript:void(0);\" onClick=\"Javascript:showBackFile('"+id+"')\">Ԥ��</a> ";
			cell.innerHTML = innerText +" <a href=\"Javascript:void(0);\" onClick=\"Javascript:showBack('"+id+"')\">������ϸ</a></center>";
		}else{
			cell.innerHTML = "";
		}
	}
	
	//add by zhangdianchao 20160420 ���Ʒ���¼��ҳ�����Ԥ�� start
	function locateDel(id) {
		var record = judicialControl_dataset.find(["id"],[id]);
		if (record) {
			judicialControl_dataset.setRecord(record);
		}
	}
	
	function showBackFile(id){
    	locateDel(id);
    	var record = judicialControl_dataset.find(["id"],[id]);
		var bdhm = record.getValue("bdhm");
		var batchNo = record.getValue("batchNo");
		
		var fileURL;
		dwr.engine.setAsync(false);
		FaYuanAction.getShowBackFilePath(batchNo,bdhm,function(data){
			fileURL = data;
		});
		dwr.engine.setAsync(true);
		
		window.location.href = "${contextPath}/filedownload/FileDownloadFyAction.do?downloadinfo="+fileURL+"&id="+id;	
    }
    //add by zhangdianchao 20160420 ���Ʒ���¼��ҳ�����Ԥ�� end
	
    //ˢ������
	function flushPage(){
		judicialControl_dataset.flushData(1);
	}
	function showDetail(id) {
		var record = judicialControl_dataset.find(["id"],[id]);
		var bdhm=record.getValue("bdhm");
		var batchNo = record.getValue("batchNo");
        var url = "/fpages/fayuan/ftl/judicialControlInfo.ftl?type=detail&id="+id+"&bdhm="+bdhm+"&batchNo="+batchNo;
		    showWin("˾������������Ϣ",url,"window","flushPage()",window);
	}

    function btCancel_onClick(){
       subwindow_floatWindowAudit.close();
    }
	//���
	function btAudit_onClick() {
		var hasSelected = false;	
		var record =judicialControl_dataset.getFirstRecord();
			while(record){
				var v_selected = record.getValue("select");
				if( v_selected == true ){
					hasSelected=true;
				}
				record=record.getNextRecord();
		   	}
		   	if (!hasSelected) {
		   		alert("��ѡ����Ӧ�ļ�¼��");
		   		return false;
		   	}
			subwindow_floatWindowAudit.show();
	}



	function btConfirm_onClickCheck() {

			var approveStatusChoose = judicialControl_dataset.getValue("approveStatusChoose");
		   	var approveResultChoose = judicialControl_dataset.getValue("approveResultChoose");
		   	if (!approveStatusChoose.length > 0) {
		   		alert("��ѡ����˽����");
		   		return false;
		   	}
		   	if (approveStatusChoose == "03" && approveResultChoose.length < 1) {
		   		alert("��˽����ͨ�������˵��������д��");
		   		return false;
		   	}
		   	var reg = new RegExp("^((?!<|>).)*$");
		   	if(!reg.test(approveResultChoose)){
		   		alert("���˵���в��ܰ�����<�����ߡ�>��");
		   		return false;
		   	}
		   	judicialControl_dataset.setParameter("approveStatusChoose",approveStatusChoose);
		   	judicialControl_dataset.setParameter("approveResultChoose",approveResultChoose);
			subwindow_floatWindowAudit.hide();
	}

	//����
	function btBack_onClick(){
		subwindow_floatWindowDetail.close();
	}
    function btConfirm_postSubmit(button){
	    alert("��˳ɹ�");
		judicialControl_dataset.flushData(judicialControl_dataset.pageIndex);
	}
    function btConfirm_postSubmit(button){
	    alert("��˳ɹ�");
		judicialControl_dataset.flushData(judicialControl_dataset.pageIndex);
	}
	function showBack(id){
		var record = judicialControl_dataset.find(["id"],[id]);
		var bdhm = record.getValue("bdhm");
		var batchNo = record.getValue("batchNo");	
        var url = "/fpages/fayuan/ftl/judicialControlBackInfo.ftl?type=detail&bdhm="+bdhm+"&batchNo="+batchNo+"&mainId="+id;
		    showWin("˾�����Ʒ�����ϸ",url,"window","flushPage()",window);
    }
</script>
</@CommonQueryMacro.page>