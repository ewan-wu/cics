<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<#assign v_type = RequestParameters["type"]?default("")>
<#assign m_type = RequestParameters["m_type"]?default("")>
<#assign v_id = RequestParameters["id"]?default("")>
<#assign v_qqdbs = RequestParameters["qqdbs"]?default("")>
<#assign v_rwlsh = RequestParameters["rwls"]?default("")>
<#--֤�պ���-->
<#assign idNo = RequestParameters["idNo"]?default("")>
<#--�˿�����-->
<#assign accountNo = RequestParameters["accountNo"]?default("")>
<#--��ѯ��������-->
<#assign qryType = RequestParameters["qryType"]?default("")>
<@CommonQueryMacro.page title="������ز�ѯ������ϸ��Ϣ">
<table width="99%" align="center" >
<#--֤�պ��� ���� �˿����� ����֮һ�ǿ�-->
    <#if idNo != "" || accountNo != "">
        <tr>
            <td>
                <@CommonQueryMacro.GroupBox id="guoup1" label="��ѯ����" expand="true">
                    <table width="100%" >
                        <tr>
                            <td>
                                <@CommonQueryMacro.CommonQuery id="picsCgReqClient" init="true" submitMode="all" navigate="false" insertOnEmpty="true">
                                    <table width="100%" >
                                        <tr>
                                            <td  align="left">
                                                  <@CommonQueryMacro.Group id="group1" label="��������������"  fieldStr="qqdbs,ckztlb,sqjgdm,mbjgdm,cxjssj" colNm=4 /></br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="left">
                                                  <@CommonQueryMacro.Group id="group1" label="�ͻ�����������"  fieldStr="rwlsh,cxfkjg,cxfkjgyy,zzlx,zzhm,khmc,lxdh,lxsj,dbrxm,dbrzjlx,dbrzjhm,zzdz,zzdh,gzdw,dwdz,dwdh,yxdz,frdb,frdbzjlx,frdbzjhm,khgszzhm,gsnsh,dsnsh" colNm=4 /></br>
                                            </td>
                                        </tr>
                                    </table>
                                </@CommonQueryMacro.CommonQuery>
                            </td>
                        </tr>
                        <tr>
                            <td width="100%">
                                <@CommonQueryMacro.CommonQuery id="picsCgReqAccount"  init="true" submitMode="all" navigate="false"  >
                                    <table  width="100%">
                                        <tr>
                                            <#if (v_type=="new") || (v_type=="update")>
                                                <td align="right" id="GuaButton">
                                                    <@CommonQueryMacro.Button id= "btNew1"/>&nbsp;&nbsp;
                                                    <@CommonQueryMacro.Button id= "btDel1"/>&nbsp;&nbsp;
                                                </td>
                                            </#if>
                                        </tr>
                                        <tr>
                                            <td>
                                                <@CommonQueryMacro.DataTable title="�˻���Ϣ"  id ="datatableAccount" fieldStr="opr[100],kh[200],zh[200],zhlb[100],zhzt[100],khwd,khwddm[150],khrq[180],xhrq[180],xhwd[100],bz[150],chbz[100],zhye[150],kyye[150],zhjysj[180],beiz" width="100%" hasFrame="true"  readonly="false"/>
                                            </td>
                                        </tr>
                                    </table>
                                </@CommonQueryMacro.CommonQuery>
                            </td>
                        </tr>
                        <#--���֤�պŷǿ� �� ��ʾ������:�˻���Ϣ���˻�������Ϣ ������ �˻���Ϣ �������ʾ ��ǿ�ƴ�ʩ�� ��������Ȩ����Ȩ�� �Լ����������˻���-->
                        <#if idNo != "" && (qryType =="03" || qryType == "01") >
                            <tr>
                                <td width="100%">
                                    <@CommonQueryMacro.CommonQuery id="picsCgReqMeasure"  init="true" submitMode="all" navigate="false"  >
                                        <table  width="100%">
                                            <tr>
                                                <#if (v_type=="new") || (v_type=="update")>
                                                    <td align="right" id="GuaButton">
                                                        <@CommonQueryMacro.Button id= "btNew2"/>&nbsp;&nbsp;
                                                        <@CommonQueryMacro.Button id= "btDel2"/>&nbsp;&nbsp;
                                                    </td>
                                                </#if>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <@CommonQueryMacro.DataTable title="ǿ�ƴ�ʩ"  id ="datatableMeasure" fieldStr="zh[200],csxh[200],djksrq[180],djjzrq[180],djjgmc[200],djje[150],beiz,djcslx[150]" width="100%" hasFrame="true"  readonly="false"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </@CommonQueryMacro.CommonQuery>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%">  <#--����Ȩ/����Ȩ-->
                                    <@CommonQueryMacro.CommonQuery id="picsCgReqPriority"  init="true" submitMode="all" navigate="false"  >
                                        <table  width="100%">
                                            <tr>
                                                <#if (v_type=="new") || (v_type=="update")>
                                                    <td align="right" id="GuaButton">
                                                        <@CommonQueryMacro.Button id= "btNew3"/>&nbsp;&nbsp;
                                                        <@CommonQueryMacro.Button id= "btDel3"/>&nbsp;&nbsp;
                                                    </td>
                                                </#if>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <@CommonQueryMacro.DataTable title="����Ȩ/����Ȩ"  id ="datatablePriority" fieldStr="zh[200],xh[200],qllx[150],zzlxdm[200],zzhm[200],qlrxm[200],qlje[150],qlrdz,qlrlxfs[200]" width="100%" hasFrame="true"  readonly="false"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </@CommonQueryMacro.CommonQuery>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%">  <#--�������˻�-->
                                    <@CommonQueryMacro.CommonQuery id="picsCgReqSubAccount"  init="true" submitMode="all" navigate="false"  >
                                        <table  width="100%">
                                            <tr>
                                                <#if (v_type=="new") || (v_type=="update")>
                                                    <td align="right" id="GuaButton">
                                                        <@CommonQueryMacro.Button id= "btNew4"/>&nbsp;&nbsp;
                                                        <@CommonQueryMacro.Button id= "btDel4"/>&nbsp;&nbsp;
                                                    </td>
                                                </#if>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <@CommonQueryMacro.DataTable title="�������˻�"  id ="datatableSubAccount" fieldStr="zh[200],zzhxh[200],zzhlb[150],zzhzh[200],bz[150],chbz[150],zhye[150],zhzt[150],kyye[150]" width="100%" hasFrame="true"  readonly="false"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </@CommonQueryMacro.CommonQuery>
                                </td>
                            </tr>
                        </#if>
                    </table>
                </@CommonQueryMacro.GroupBox>
            </td>
        </tr>
    </#if>
    <tr>
        <td>
            <@CommonQueryMacro.GroupBox id="guoup1" label="��ѯ����" expand="true">
                <table width="100%" >
                    <tr>
                        <td>
                            <@CommonQueryMacro.CommonQuery id="picsCgReq" init="true" submitMode="allchange" navigate="false" insertOnEmpty="true">
                                <table width="100%" >
                                    <tr>
                                        <td  align="left">
                                                <@CommonQueryMacro.Group id="group1" label="��ѯ�������������"  fieldStr="qqdbs,qqcslx,sqjgdm,mbjgdm,ckztlb,ajlx,jjcd,beiz,fssj" colNm=4 /></br>    <#--,qqcslx,sqjgdm,mbjgdm-->
                                        </td>
                                    </tr>
                                </table>
                            </@CommonQueryMacro.CommonQuery>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <@CommonQueryMacro.CommonQuery id="picsCgZtReq" init="true" submitMode="allchange" navigate="false" insertOnEmpty="true">
                                <table width="100%" >
                                    <tr>
                                        <td  align="left">
                                                <@CommonQueryMacro.Group id="group2" label="��ѯ����������"  fieldStr="qqdbs,rwls,zzlx,zzhm,ztmc,cxzh,cxnr,mxsdlx,mxqssj,mxjzsj" colNm=4 /></br>    <#--qqdbs,ztmc,cxzh-->
                                        </td>
                                    </tr>
                                </table>
                            </@CommonQueryMacro.CommonQuery>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <@CommonQueryMacro.CommonQuery id="picsCgReq" init="true" submitMode="allchange" navigate="false" insertOnEmpty="true">
                                <table width="100%" >
                                    <tr>
                                        <td  align="left">
                                                <@CommonQueryMacro.Group id="group1" label="��ѯ��������"  fieldStr="qqrxm,qqrzjlx,qqrzjhm,qqrdwmc,qqrsjh,xcrxm,xcrzjlx,xcrzjhm" colNm=4 /></br>    <#--,qqcslx,sqjgdm,mbjgdm-->
                                        </td>
                                    </tr>
                                </table>
                            </@CommonQueryMacro.CommonQuery>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <@CommonQueryMacro.CommonQuery id="PicsFlws"   init="true" submitMode="allchange" navigate="false"  >
                                <table width="100%" align="left" cellpadding="2">
                                    <tr>
                                    <tr>
                                        <td>
                                            <@CommonQueryMacro.DataTable  id ="PicsFlwsDatatable"  title="����֤����Ϣ" fieldStr="wjmc,wjlx,wslx,wsnr" width="100%" hasFrame="true"  readonly="false"/>
                                        </td>
                                    </tr>
                                    </tr>

                                </table>
                            </@CommonQueryMacro.CommonQuery>

                        </td>
                    </tr>
                </table>
            </@CommonQueryMacro.GroupBox>
        </td>
    </tr>

    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="picsCgZtReq" init="false" submitMode="allchange" navigate="false" insertOnEmpty="true">
                <table width="100%" align="left" cellpadding="2">
                    <tr>
                        <td colspan="2" align="center">

                            <#if (v_type=="new") || (v_type=="update")>
                                <@CommonQueryMacro.Button id= "btSave"/>&nbsp;&nbsp;
                                <@CommonQueryMacro.Button id= "btSubmit"/>&nbsp;&nbsp;
                            </#if>
                            <@CommonQueryMacro.Button id= "btBack"/>
                        </td>
                    </tr>
                </table>
            </@CommonQueryMacro.CommonQuery>
        <td>
    </tr>
</table>
<script language="javascript">
    var type = "${v_type}";
    var qqdbs = "${v_qqdbs}";
    var rwlsh = "${v_rwlsh}";
    var id = "${v_id}";
    var idNo = "${idNo}";
//    �˿�����
    var accountNo = "${accountNo}";
//    ��ѯ����
    var qryType = "${qryType}";  //default:01�˻���Ϣ��02������ϸ��03�˻�+������ϸ��Ϣ
    function initCallGetter_post(dataset) {
        $("#PicsFlwsDatatable_paginationbar").prev().children(":first").html("<h5>����֤����Ϣ</h5>");
        //idNo ֤�պ�  accountNo�˿���
        if(idNo!="" || accountNo != ""){
            $("#datatableAccount_paginationbar").prev().children(":first").html("<h5>�˻���Ϣ</h5>");
            if(idNo!=""){
                $("#datatableMeasure_paginationbar").prev().children(":first").html("<h5>ǿ�ƴ�ʩ��Ϣ</h5>");
                $("#datatablePriority_paginationbar").prev().children(":first").html("<h5>����Ȩ/����Ȩ</h5>");
                $("#datatableSubAccount_paginationbar").prev().children(":first").html("<h5>�������˻�</h5>");
            }
    		var ckztlb = picsCgReq_dataset.getValue("ckztlb");
            var mbjgdm = picsCgReq_dataset.getValue("mbjgdm");
    		var sqjgdm = picsCgReq_dataset.getValue("sqjgdm");
            picsCgReqClient_dataset.setReadOnly(false);
            picsCgReqClient_dataset.setValue("qqdbs",qqdbs);
            picsCgReqClient_dataset.setValue("rwlsh",rwlsh);
            picsCgReqClient_dataset.setValue("ckztlb",ckztlb);
            picsCgReqClient_dataset.setValue("sqjgdm",sqjgdm);
            picsCgReqClient_dataset.setValue("mbjgdm",mbjgdm);
            picsCgReqClient_dataset.setValue("mainId",id);
            picsCgReqAccount_dataset.setReadOnly(false);
        }
        picsCgReqClient_dataset.setFieldRequired("lxdh",true);//��ϵ��ʽ����2017.04.14cc
        picsCgReqClient_dataset.setFieldRequired("lxsj",true);
        picsCgReq_dataset.setReadOnly(true);
        picsCgZtReq_dataset.setReadOnly(true);
        //��������
        PicsFlws_dataset.setAllFieldsReadOnly(true);
    }

	function picsCgReqClient_dataset_afterChange(dataset,field){
		if(field.fieldName =="cxfkjg"){
			var result = picsCgReqClient_dataset.getValue("cxfkjg");
			if(result =="01"){
				picsCgReqClient_dataset.setValue("cxfkjgyy","�ɹ�");
			}else{
				picsCgReqClient_dataset.setValue("cxfkjgyy","");
			}
		}
		if(field.name=="lxdh"){//��ϵ��ʽ����2017.04.14cc
            if(picsCgReqClient_dataset.getValue("lxdh")==""){
	            picsCgReqClient_dataset.setFieldRequired("lxsj",true);
            }else{
             	picsCgReqClient_dataset.setFieldRequired("lxsj",false);
            }
            return true;
        }
        if(field.name=="lxsj"){
            if(picsCgReqClient_dataset.getValue("lxsj")==""){
	            picsCgReqClient_dataset.setFieldRequired("lxdh",true);
            }else{
                picsCgReqClient_dataset.setFieldRequired("lxdh",false);        
            }
            return true;
        }
	}
	
    function btBack_onClick(button) {
        closeWin();
    }

    function btSave_postSubmit(button){
        if(confirm("����ɹ�,�Ƿ񷵻�!")){
            closeWin(true);
        }
        PicsCgZtReq_dataset.flushData(1);
    }

    function btDel_onClickCheck(){
        if(confirm("���ü�¼ɾ�������ɻָ�����ȷ��!")){
            return true;
        }
        return false;
    }

    function btDel_postSubmit(button){
        if(confirm("ɾ���ɹ�,�Ƿ񷵻�!")){
            closeWin(true);
        }
    }

    function btSubmit_postSubmit(button){
        if(confirm("�ύ�ɹ�,�Ƿ񷵻�!")){
            closeWin(true);
        }
    }

    function datatableAccount_opr_onRefresh(cell, value, record){
        if(record){
            var id = record.getValue("id");
            var goto = "TradeDetail";
            //01�˻���Ϣ��02������ϸ��03�˻�+������ϸ��Ϣ   default:02
            if(qryType == "02" || qryType == "03"){
                cell.innerHTML = "<center><a href=\"Javascript:void(0);\" onClick=\"Javascript:showDetail('"+id+"')\">������Ϣ</a></center> ";
            }
        }else{
            cell.innerHTML = "";
        }
    }

    function showDetail(id) {
        if(""==id){
            alert("���ȱ�������˻���Ϣ��");
            return false;
        }else{
            var record = picsCgReqAccount_dataset.find(["id"],[id]);
            var qqdbs=record.getValue("qqdbs");
            var rwls=record.getValue("rwlsh");
            var url = "/fpages/gongan/ftl/ComonQryActTradeDetail.ftl?type="+type+"&pkid="+id+"&qqdbs="+qqdbs+"&rwls="+rwls;
            showWin("������Ϣ",url,"window","flushPage()",window);
        }
    }
    //ˢ������
    function flushPage(){
        //judicial_dataset.pageIndex
        picsCgReqAccount_dataset.flushData(1);
    }
    //������
	function PicsFlwsDatatable_wjmc_onRefresh(cell, value, record){
		var id = record.getValue("id");
		if(record){
			var wjmc = record.getValue("wjmc");
			var wsnr = encodeURI(record.getValue("wsnr"));
			cell.innerHTML = "<a href=\"Javascript:void(0);\" onClick=\"Javascript:downloadfile('"+wsnr+"')\">"+wjmc+"</a> ";
		}
	}
	//���ر����ļ�
	function downloadfile(fileURL){
		var id=picsCgZtReq_dataset.getValue("id");
		var stbrno=picsCgZtReq_dataset.getValue("stbrNo");
		var fileURL=decodeURI(fileURL);
		window.location.href = "${contextPath}/filedownload/DownloadPicsAttachmentsAction.do?downloadinfo="+fileURL+"&id="+id+"&stbrno="+stbrno;
	}
    function btNew1_onClick(button) {
        picsCgReqAccount_dataset.setValue("kh",accountNo);
        picsCgReqAccount_dataset.setValue("zh",accountNo);
    }
    function btNew2_onClick(button) {
        picsCgReqMeasure_dataset.setValue("zh",accountNo);
    }
    function btNew3_onClick(button) {
        picsCgReqPriority_dataset.setValue("zh",accountNo);
    }
    function btNew4_onClick(button) {
        picsCgReqSubAccount_dataset.setValue("zh",accountNo);
    }
</script>
</@CommonQueryMacro.page>

