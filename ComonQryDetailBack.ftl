<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<#assign v_type = RequestParameters["type"]?default("")>
<#assign m_type = RequestParameters["m_type"]?default("")>
<#assign v_id = RequestParameters["id"]?default("")>
<#assign v_qqdbs = RequestParameters["qqdbs"]?default("")>
<#assign v_rwlsh = RequestParameters["rwls"]?default("")>
<#--证照号码-->
<#assign idNo = RequestParameters["idNo"]?default("")>
<#--账卡号码-->
<#assign accountNo = RequestParameters["accountNo"]?default("")>
<#--查询内容类型-->
<#assign qryType = RequestParameters["qryType"]?default("")>
<@CommonQueryMacro.page title="公安查控查询请求详细信息">
<table width="99%" align="center" >
<#--证照号码 或者 账卡号码 其中之一非空-->
    <#if idNo != "" || accountNo != "">
        <tr>
            <td>
                <@CommonQueryMacro.GroupBox id="guoup1" label="查询反馈" expand="true">
                    <table width="100%" >
                        <tr>
                            <td>
                                <@CommonQueryMacro.CommonQuery id="picsCgReqClient" init="true" submitMode="all" navigate="false" insertOnEmpty="true">
                                    <table width="100%" >
                                        <tr>
                                            <td  align="left">
                                                  <@CommonQueryMacro.Group id="group1" label="反馈基本数据项"  fieldStr="qqdbs,ckztlb,sqjgdm,mbjgdm,cxjssj" colNm=4 /></br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="left">
                                                  <@CommonQueryMacro.Group id="group1" label="客户基本数据项"  fieldStr="rwlsh,cxfkjg,cxfkjgyy,zzlx,zzhm,khmc,lxdh,lxsj,dbrxm,dbrzjlx,dbrzjhm,zzdz,zzdh,gzdw,dwdz,dwdh,yxdz,frdb,frdbzjlx,frdbzjhm,khgszzhm,gsnsh,dsnsh" colNm=4 /></br>
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
                                                <@CommonQueryMacro.DataTable title="账户信息"  id ="datatableAccount" fieldStr="opr[100],kh[200],zh[200],zhlb[100],zhzt[100],khwd,khwddm[150],khrq[180],xhrq[180],xhwd[100],bz[150],chbz[100],zhye[150],kyye[150],zhjysj[180],beiz" width="100%" hasFrame="true"  readonly="false"/>
                                            </td>
                                        </tr>
                                    </table>
                                </@CommonQueryMacro.CommonQuery>
                            </td>
                        </tr>
                        <#--如果证照号非空 且 显示内容是:账户信息和账户交易信息 或者是 账户信息 则额外显示 “强制措施” ，“共有权优先权” 以及“关联子账户”-->
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
                                                    <@CommonQueryMacro.DataTable title="强制措施"  id ="datatableMeasure" fieldStr="zh[200],csxh[200],djksrq[180],djjzrq[180],djjgmc[200],djje[150],beiz,djcslx[150]" width="100%" hasFrame="true"  readonly="false"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </@CommonQueryMacro.CommonQuery>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%">  <#--共有权/优先权-->
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
                                                    <@CommonQueryMacro.DataTable title="共有权/优先权"  id ="datatablePriority" fieldStr="zh[200],xh[200],qllx[150],zzlxdm[200],zzhm[200],qlrxm[200],qlje[150],qlrdz,qlrlxfs[200]" width="100%" hasFrame="true"  readonly="false"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </@CommonQueryMacro.CommonQuery>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%">  <#--关联子账户-->
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
                                                    <@CommonQueryMacro.DataTable title="关联子账户"  id ="datatableSubAccount" fieldStr="zh[200],zzhxh[200],zzhlb[150],zzhzh[200],bz[150],chbz[150],zhye[150],zhzt[150],kyye[150]" width="100%" hasFrame="true"  readonly="false"/>
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
            <@CommonQueryMacro.GroupBox id="guoup1" label="查询请求" expand="true">
                <table width="100%" >
                    <tr>
                        <td>
                            <@CommonQueryMacro.CommonQuery id="picsCgReq" init="true" submitMode="allchange" navigate="false" insertOnEmpty="true">
                                <table width="100%" >
                                    <tr>
                                        <td  align="left">
                                                <@CommonQueryMacro.Group id="group1" label="查询请求基本数据项"  fieldStr="qqdbs,qqcslx,sqjgdm,mbjgdm,ckztlb,ajlx,jjcd,beiz,fssj" colNm=4 /></br>    <#--,qqcslx,sqjgdm,mbjgdm-->
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
                                                <@CommonQueryMacro.Group id="group2" label="查询主体数据项"  fieldStr="qqdbs,rwls,zzlx,zzhm,ztmc,cxzh,cxnr,mxsdlx,mxqssj,mxjzsj" colNm=4 /></br>    <#--qqdbs,ztmc,cxzh-->
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
                                                <@CommonQueryMacro.Group id="group1" label="查询人数据项"  fieldStr="qqrxm,qqrzjlx,qqrzjhm,qqrdwmc,qqrsjh,xcrxm,xcrzjlx,xcrzjhm" colNm=4 /></br>    <#--,qqcslx,sqjgdm,mbjgdm-->
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
                                            <@CommonQueryMacro.DataTable  id ="PicsFlwsDatatable"  title="文书证件信息" fieldStr="wjmc,wjlx,wslx,wsnr" width="100%" hasFrame="true"  readonly="false"/>
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
//    账卡号码
    var accountNo = "${accountNo}";
//    查询内容
    var qryType = "${qryType}";  //default:01账户信息，02交易明细，03账户+交易明细信息
    function initCallGetter_post(dataset) {
        $("#PicsFlwsDatatable_paginationbar").prev().children(":first").html("<h5>文书证件信息</h5>");
        //idNo 证照号  accountNo账卡号
        if(idNo!="" || accountNo != ""){
            $("#datatableAccount_paginationbar").prev().children(":first").html("<h5>账户信息</h5>");
            if(idNo!=""){
                $("#datatableMeasure_paginationbar").prev().children(":first").html("<h5>强制措施信息</h5>");
                $("#datatablePriority_paginationbar").prev().children(":first").html("<h5>共有权/优先权</h5>");
                $("#datatableSubAccount_paginationbar").prev().children(":first").html("<h5>关联子账户</h5>");
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
        picsCgReqClient_dataset.setFieldRequired("lxdh",true);//联系方式控制2017.04.14cc
        picsCgReqClient_dataset.setFieldRequired("lxsj",true);
        picsCgReq_dataset.setReadOnly(true);
        picsCgZtReq_dataset.setReadOnly(true);
        //法律文书
        PicsFlws_dataset.setAllFieldsReadOnly(true);
    }

	function picsCgReqClient_dataset_afterChange(dataset,field){
		if(field.fieldName =="cxfkjg"){
			var result = picsCgReqClient_dataset.getValue("cxfkjg");
			if(result =="01"){
				picsCgReqClient_dataset.setValue("cxfkjgyy","成功");
			}else{
				picsCgReqClient_dataset.setValue("cxfkjgyy","");
			}
		}
		if(field.name=="lxdh"){//联系方式控制2017.04.14cc
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
        if(confirm("保存成功,是否返回!")){
            closeWin(true);
        }
        PicsCgZtReq_dataset.flushData(1);
    }

    function btDel_onClickCheck(){
        if(confirm("将该记录删除，不可恢复，请确认!")){
            return true;
        }
        return false;
    }

    function btDel_postSubmit(button){
        if(confirm("删除成功,是否返回!")){
            closeWin(true);
        }
    }

    function btSubmit_postSubmit(button){
        if(confirm("提交成功,是否返回!")){
            closeWin(true);
        }
    }

    function datatableAccount_opr_onRefresh(cell, value, record){
        if(record){
            var id = record.getValue("id");
            var goto = "TradeDetail";
            //01账户信息，02交易明细，03账户+交易明细信息   default:02
            if(qryType == "02" || qryType == "03"){
                cell.innerHTML = "<center><a href=\"Javascript:void(0);\" onClick=\"Javascript:showDetail('"+id+"')\">交易信息</a></center> ";
            }
        }else{
            cell.innerHTML = "";
        }
    }

    function showDetail(id) {
        if(""==id){
            alert("请先保存关联账户信息！");
            return false;
        }else{
            var record = picsCgReqAccount_dataset.find(["id"],[id]);
            var qqdbs=record.getValue("qqdbs");
            var rwls=record.getValue("rwlsh");
            var url = "/fpages/gongan/ftl/ComonQryActTradeDetail.ftl?type="+type+"&pkid="+id+"&qqdbs="+qqdbs+"&rwls="+rwls;
            showWin("交易信息",url,"window","flushPage()",window);
        }
    }
    //刷新数据
    function flushPage(){
        //judicial_dataset.pageIndex
        picsCgReqAccount_dataset.flushData(1);
    }
    //文书表格
	function PicsFlwsDatatable_wjmc_onRefresh(cell, value, record){
		var id = record.getValue("id");
		if(record){
			var wjmc = record.getValue("wjmc");
			var wsnr = encodeURI(record.getValue("wsnr"));
			cell.innerHTML = "<a href=\"Javascript:void(0);\" onClick=\"Javascript:downloadfile('"+wsnr+"')\">"+wjmc+"</a> ";
		}
	}
	//下载报文文件
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

