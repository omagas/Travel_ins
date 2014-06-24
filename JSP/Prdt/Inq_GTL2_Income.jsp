<%-- 
    Document   : Inq_GTL2_Income
    Created on : 2013/6/27, 上午 10:44:50
    Author     : Louie.Zheng
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/inq_gtl2_income.js"/>"></script>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/constant_unicode.js"/>"></script>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/common.js"/>"></script>

    </head>  
    <div id="tab-query">
        <!--content table item start-->
        <!--橫式table-->
        <table width="95%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
            <thead>
                <tr>
                    <th class="tableHeaderQueryLeft" colspan="5"><div align="left">&nbsp;*日期區間請擇一填寫，非日期區間欄位至少搭配一種作為查詢條件。</div></th>
                    <th width="30" class="tableHeaderQueryRight">&nbsp;</th>
                </tr>
            </thead>            
            <tbody>

                <tr>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.dataId"/>-<s:text name="label.dataIDVerNo"/></label></th>
                    <td class="tableData" colspan="1">
                        <s:textfield id="dataID" name="qryAppIncomeDtParam.dataID" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" maxLength="20" theme="simple"/>
                        &nbsp;-&nbsp;
                        <s:textfield id="dataIDVerNo" name="qryAppIncomeDtParam.dataIDVerNo" cssClass="text" cssStyle="width:30px;text-transform: uppercase;" maxLength="2" theme="simple"/>
                    </td>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.procStatusCD"/></label></th>
                    <td class="tableData" colspan="1">
                        <s:select id="procStatusCD" name="qryAppIncomeDtParam.procStatusCD" list="procStatusList" listKey="procStatusCD" listValue="procStatusNm"  emptyOption="true"  cssClass="textheavy" theme="simple"/>
                    </td>
                </tr>
                <tr>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.agntCD"/></label></th>
                    <td class="tableData" colspan="3">
                        <s:textfield id="inqAgntCD" name="qryAppIncomeDtParam.agntCD" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                    </td>
                </tr>
                <tr>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.insuredCustNm"/></label></th>
                    <td class="tableData" colspan="1">
                        <s:textfield id="insuredCustNm" name="qryAppIncomeDtParam.insuredCustNm" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                    </td>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.applicantCustNm"/></label></th>
                    <td class="tableData" colspan="1">
                        <s:textfield id="applicantCustNm" name="qryAppIncomeDtParam.applicantCustNm" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                    </td>

                </tr>
                <tr>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.insuredCustID"/></label></th>
                    <td class="tableData" colspan="1">
                        <s:textfield id="insuredCustID" name="qryAppIncomeDtParam.insuredCustID" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                    </td>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.applicantCustID"/></label></th>
                    <td class="tableData" colspan="1">
                        <s:textfield id="applicantCustID" name="qryAppIncomeDtParam.applicantCustID" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                    </td>
                </tr>
                <tr>
                    <th class="tableLabel" colspan="1" width="160px;"><label><s:text name="label.incomeDtSE"/></label></th>
                    <td class="tableLast" colspan="3">
                        <s:text name="label.incomeDtS"/>
                        <s:textfield id="incomeDtS" name="qryAppIncomeDtParam.incomeDtS" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                        <s:text name="label.incomeDtE"/>
                        <s:textfield id="incomeDtE" name="qryAppIncomeDtParam.incomeDtE" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                    </td>
                </tr>
                <tr>
                    <th class="tableLabel" colspan="1" width="160px;"><div><s:text name="生效日區間"/></div><div><s:text name="(旅遊開始日)"/></div></label</th>
                    <td class="tableLast" colspan="3">
                        <s:text name="label.incomeDtS"/>
                        <s:textfield id="incomeTDtS" name="qryAppIncomeTDtParam.incomeDtS" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                        <s:text name="label.incomeDtE"/>
                        <s:textfield id="incomeTDtE" name="qryAppIncomeTDtParam.incomeDtE" cssClass="text" cssStyle="width:120px;text-transform: uppercase;" theme="simple"/>
                    </td>
                </tr>                
                <tr>
                    <td colspan="4">
                        <div class="ui-widget">
                            <div id="queryTips" class="ui-state-error ui-corner-all" style="padding: 0.7em; display:none;">
                                <p style="font-size: 12px;">
                                    <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                    <s:text name="message.validationMsg"/><br/>
                                </p>
                                <p id="queryTipsMsg" style="font-size: 12px;">
                                </p>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" width="95%" summary="">
            <tr>
                <td colspan="1" >
                    <div align="right">
                        <input class="button57" type="button" id="actn_qry" value="<s:text name="button.query"/>">
                        <input class="button57" type="button" id="actn_clear" value="<s:text name="button.clear"/>">
                    </div>
                </td>
            </tr>
        </table>
        <table width="95%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" style="">
            <thead>
                <tr>
                    <th class="tableHeaderLeft" nowrap><s:text name="label.dataId"/>-<s:text name="label.dataIDVerNo"/></th>
                    <th class="tableHeaderMiddle" nowrap><s:text name="label.insuredCustNm"/></th>
                    <th class="tableHeaderMiddle" nowrap><s:text name="label.insEffDt_zh"/></th>
                    <th class="tableHeaderMiddle" nowrap><s:text name="label.incomeDt"/></th>
                    <th class="tableHeaderMiddle" nowrap><s:text name="label.totPrm"/></th>
                    <th class="tableHeaderMiddle" nowrap><s:text name="label.procStatus"/></th>
                    <th class="tableHeaderRight" nowrap><s:text name="label.exec"/></th>
                </tr>
            </thead>
            <tbody id="incomeTbody">
            <td class="tableData" >&nbsp;S00001-1</td>
            <td class="tableData" >&nbsp;王大同</td>
            <td class="tableData" >&nbsp;2012/07/05</td>
            <td class="tableData" >&nbsp;2012/07/04</td>
            <td class="tableData" >&nbsp;500元</td>
            <td class="tableData" >&nbsp;完成</td>
            <td class="tableData" >&nbsp;
                <select id="ResultExecute" name="NResultExecute" >
                       R001||補列印要保書、投保證明、繳費證明","R002||檢視報價結果","R003||檢視要保輸入","R004||修改報價單","R005||複製為另一張報價單","R006||線上付款
                       <option value="R001">補列印要保書、投保證明、繳費證明</option>
                </select>    
            </td>
            </tbody>
                

        </table>
        <!--content table item end-->
    </div>
    <div id="reason-form" title="<s:text name="dialog.title"/>" style="text-align: left">
        <table width="98%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" id="Content_Tb">
            <tbody>
                <tr>
                    <td class="tableDataFirst"><FONT color="#ff0000">* </FONT><s:text name="dialog.reason"/></td>
                    <td class="tableDataFirst">
                        <select id="reasonCD"></select>
                    </td>
                </tr>
                <tr>
                    <td class="tableData">&nbsp;&nbsp;&nbsp;<s:text name="dialog.comment"/>
                    </td>
                    <td class="tableData"><s:textarea id="reasonDesc" name="reasonDesc" cols="50" rows="4"/></td>
                </tr>
            </tbody>
        </table>
    </div>
</html>
