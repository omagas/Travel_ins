<%-- 
    Document   : Quot_GTL_Input
    Created on : 2013/6/27, 上午 10:44:50
    Author     : Louie.Zheng
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title><s:text name="page.title"/></title>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/public/func_chk.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/constant_unicode.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/validate_common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/quot_gtl2_input.js"/>"></script>
        <!--script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/jquery.json-2.3.js"/>"></script-->

        <style>
            .reject{ background-color:#B2D7BB;}
            #content .ui-tabs-nav {
                padding-left: 0px;
                background: transparent;
                border-width: 0px 0px 1px 0px;
                border-radius: 0px;
                -moz-border-radius: 0px;
                -webkit-border-radius: 0px;
            }
            .noBackround {
                background-image: none !important;
            }
        </style>
    </head>
    <body>
        <div style="float:left;width:855px;border: 0" id="content">
            <ul id="tab-ul" style="margin-top: 0">
                <li><a href="#tab-input"><s:text name="label.input"/></a></li>             
                <li><a href="#tab-query"><s:text name="label.query.Status"/></a></li>
        
            </ul>
            <div id="tab-input">
                <!--tab items start (item start right to left)-->
                <div class="infoTextContRight">
                    <h2><span><b><s:text name="label.prdt"/></b></span></h2>
                    <div class="tabContRight">
                        <div id="advancedSearchTabStart" class="tabInActiveEndRight"></div>
                        <div id="advancedSearchTabText" class="tabInActiveTextRight"><a href="#" class="topnav"><s:text name="label.result"/></a></div>
                        <div id="advancedSearchTabEnd" class="tabInActiveStartRight"></div>
                        <div id="simpleSearchTabStart" class="tabActiveEndRight"></div>
                        <div id="simpleSearchTabText" class="tabActiveTextRight"><s:text name="label.input"/></div>
                        <div id="simpleSearchTabEnd" class="tabActiveStartRight"></div>
                    </div>
                </div>
                <!--tab items end-->
                <s:hidden id="pllBusKindRefMapJSON" value="%{pllBusKindRefMapJSON}"/>
                <!--s:form id="form" method="post" onsubmit="return validateSubmit();" enctype="multipart/form-data"-->
                <s:form id="form" method="post" action="quot_calc"  enctype="multipart/form-data">    
                    <input type="hidden" id="oriVerNo" name="oriVerNo"/>
                    <s:hidden id="queryTyp" name="queryTyp"/>
                    <s:hidden id="queryDataId" name="queryDataId"/>
                    <s:hidden id="inputDataId" name="inputDataId"/>
                    <s:hidden id="inputDataIdVerNo" name="inputDataIdVerNo" value='0'/>
                    <s:hidden id="projDataJSON" name="projDataJSON"/>
                    <s:hidden id="projTbodyHTML" name="projTbodyHTML"/>
                    <s:hidden id="appGPAMBusKindCD" name="appGPAM.busKindCD"/>
                    <s:hidden id="foreignerMK" name="custD.foreignerMK" value="N"/>
                    <s:hidden id="custTyp" name="custD.custTyp" value="C"/>
                    <s:hidden id="AGECustAge15cnt_h" name="AGECustAge15cnt_h"/>
                    <s:hidden id="AGECustAge15_80cnt_h" name="AGECustAge15_80cnt_h"/>
                    <s:hidden id="AGECustAge80cnt_h" name="AGECustAge80cnt_h"/>
                    <!--content table item start-->
                    <!--橫式table-->

                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">

                        <tbody>
                            <tr>

                                <td class="tableDataFirst">
                                    <FONT color="#ff0000">*&nbsp; </FONT><s:text name="label.agntCD"/>&nbsp;
                                    <!--sx:autocompleter id="agntCD" list="%{agntCDList}" listValue="agntCD" listKey="agntCD" keyName="appM.agntCD"
                                                      autoComplete="true" emptyOption="true" valueNotifyTopics="changeAgntCD" resultsLimit="100"/-->
                                    <select id="agntCD" class="tbselect"><!--Hard Code-->
                                        <option>A0020G04</option>
                                        <option>310310</option>                                        
                                    </select>
                                </td>
                                <td class="tableDataFirst">
                                    &nbsp;
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="2"><div align="left">&nbsp;<s:text name="label.th1"/></div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tableSubhead" width="130">
                                    <div align="left">
                                        <FONT color="#ff0000">* </FONT>
                                        <s:text name="label.th1.tsh1"/>
                                    </div>
                                </td>
                                <td class="tableData"><!--時間-->
                                    <s:text name="label.th1.td1.text1"/>
                                    <s:textfield id="from" name="appM.insEffDtString" cssClass="textheavy" theme="simple"/>
                                    <s:textfield id="tm" name="appM.insEffTM" style="width:25px;text-align:right;" maxlength="2" cssClass="textheavy" theme="simple"/>
                                    <s:text name="時起，"/>    
                                    共 <input id="days" type="text" style="width:25px;text-align:right;" maxlength="2" class="text"> 天
                                    <br>
                                    <br>
                                    <s:text name="label.th1.td1.text2"/>
                                    <s:textfield id="to" name="appM.insExpDtString" cssClass="textheavy" theme="simple"/>
                                    <s:textfield id="to_tm" style="width:25px;text-align:right;" maxlength="2" cssClass="textheavy" disabled="true" theme="simple"/>
                                    <s:text name="label.th1.td1.text3"/>&nbsp;                                   
                                    <br>
                                    <br>
                                    <FONT color="#ff0000">USER輸入起始日時及天數後系統自動計算迄日時，以24小時計。</FONT>
                                </td>
                                <td class="tableData">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="tableSubhead" width="130">
                                    <FONT color="#ff0000">* </FONT>
                                    <s:text name="label.th1.tsh4"/>
                                </td>
                                <td class="tableData">
                                 <p>
                                    <input type="radio" name="appGPAM.tourArea" id="tourAreaY" class="tourArea" value="Y"/>
                                    <s:text name="國外"/>&nbsp;
                                    <input type="radio" name="appGPAM.tourArea" id="tourAreaN" class="tourArea" value="N" checked/>
                                    <s:text name="國內"/>&nbsp;
                                 </p>                                    
                                    <!--s:select id="tourAreaCD" name="tourAreaCD" list="tourAreaMap.values" listKey="tourAreaCD" listValue="tourAreaNm" emptyOption="true" theme="simple"/-->
                                    <select id="tourAreaCD" class="tbselect"></select>
                                    <s:text name="label.th1.td4.text1"/>
                                    <s:textfield id="tourPlaceDesc" name="tourPlaceDesc" style="width:150px;" maxlength="200" cssClass="textheavy" theme="simple"/>&nbsp;
                                    <input id="cntyCDBtn" type="button" class="button36big" value="<s:text name="button.quick"/>">
                                </td>
                                <td class="tableData">&nbsp;</td>
                            </tr>
                            <tbody
                       </table>
                       <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" colspan="2"><div align="left">&nbsp;<s:text name="label.th2"/></div></th>
                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="tableSubhead" width="130">
                                        <div align="left">
                                            <FONT color="#ff0000">* </FONT>
                                            <s:text name="label.proj"/>
                                        </div>
                                    </td>                                
                                    <td class="tableData">
                                        <div id="box"><div class="cntWidht660"><div class="cntTitleSkyBlue"><div class="cntBgSkyBlue">
                                                        <p>
                                                            <input type="radio" name="appGPAM.suitMK" id="suitMKY" value="Y"/>
                                                            <s:text name="label.suit"/>&nbsp;
                                                            <input type="radio" name="appGPAM.suitMK" id="suitMKN" value="N"/>
                                                            <s:text name="label.keyin"/>&nbsp;
                                                        </p>
                                                        <p id="Proj">
                                                            <select id="ProjNM" name="ProjNM" class="tbselect"></select> 
                                                            <input id="BrowersuitBtn" type="button" class="button100big" value="<s:text name="button.Browersuit"/>">
                                                            <FONT color="#ff0000">(方案內容預設為：個人責任保險基本型)</FONT>
                                                        </p>
                                                        <p></p>
                                                    </div></div></div></div>
                                                   
                                    </td>
                                    <td class="tableData">&nbsp;</td> 
                                </tr>
                                
                                  <tr id="rateTypeTR">
                                        <td class="tableSubhead"><FONT color="#ff0000">&nbsp;&nbsp;&nbsp;</FONT>    
                                        </td>
                                        <td class="tableData">
                                            <FONT color="#ff0000">下列勾選之各項保險金額適用於每一被保險人</FONT>

                                        <TABLE border="0" cellpadding="4" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;共同投保內容</div></th>
                                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                                </tr>
                                            </thead>                 
                                            <tbody>
                                                <TR>
                                                    <TD class="tableSubhead">個人責任</TD>
                                                    <TD ><select id="optionResponsibility"></select>萬元</TD>
                                                    <TD rowspan="3" colspan="2" style='border-right-style:dotted; border-right-color:#87ceeb; border-right-width: 1px;'><p><input type="checkbox">特定事故加倍給付</p><p><input type="checkbox">重大燒燙傷</p></TD>
                                                </TR> 
                                                <TR>
                                                    <TD class="tableSubhead">旅行取消</TD>
                                                    <TD><select id="optionCancel" id="">
                                                        </select>萬元
                                                    </TD>
                                                </TR>    
                                                <TR>
                                                    <TD class="tableSubhead"><input type="checkbox" >劫機慰問</TD>
                                                    <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="2" disabled="true"/>萬元</TD>
                                                </TR>
                                            </tbody>
                                            <tbody id="foreign_set">
                                                <TR>
                                                    <TD class="tableSubhead">行李損失</TD>
                                                    <TD ><select id="Packagelost"></select>萬元</TD>
                                                    <TD class="tableSubhead"><input type="checkbox" >額外費用</TD>
                                                    <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="3.3" disabled="true"/>萬元</TD>

                                                </TR> 
                                                <TR>
                                                    <TD class="tableSubhead">行程更改</TD>
                                                    <TD><select id="Schedulechange"></select>萬元</TD>
                                                    <TD class="tableSubhead">行李延誤</TD>
                                                    <TD><select id="Packagedelay"></select>萬元</TD>
                                                </TR>    
                                                <TR>
                                                    <TD class="tableSubhead"><input type="checkbox">食物中毒</TD>
                                                    <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="0.3"  disabled="true"/>萬元</TD>
                                                    <TD class="tableSubhead"><input type="checkbox">竊盜損失</TD>
                                                    <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="0.3"  disabled="true" />萬元</TD>
                                                </TR>
                                                <TR>
                                                    <TD colspan="2"><input type="checkbox">緊急救援</TD>
                                                    <TD  colspan="2"><input type="checkbox">海外急難救助</TD>
                                                </TR>  
                                            </tbody>                                            
                                        </TABLE>


                 

                                           
                                        </td>
                                  </tr>          
                            </tbody>       
                       </table>

                       <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;<s:text name="label.th3"/></div></th>
                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="tableData" style="width: 270px;">
                                        <FONT color="#ff0000">*</font>15足歲以下<s:textfield id="AGECustAge15cnt" name="AGECustAge15cnt" style="text-align: right; width: 25px;" maxlength="3" cssClass="textheavy"  theme="simple"/>&nbsp;人 / ADD
                                        <select id="AGECustAge15ADD" class="tbselect"></select>萬
                                                                  
                                    </td>
                                    <td class="tableData" style="width: 150px;">
                                        / MR<select id="AGECustAge15MR" class="tbselect">
                                        </select>萬        
                                    </td>   
                                    <td class="tableData">
                                      / 海突住院<select id="AGECustAge15OS" class="tbselect">                                        
                                      </select>萬
                                    </td>  
                                    <td class="tableData"><input id="15PRJBtn" type="button" class="button36big" value="<s:text name="button.add"/>"></td>
                                </tr>
                                <tr>
                                    <td class="tableData" style="width: 270px;">
                                        <FONT color="#ff0000">*</font>15足歲以上<s:textfield id="AGECustAge15_80cnt" name="AGECustAge15_80cnt" style="text-align: right; width: 25px;" maxlength="3" cssClass="textheavy"  theme="simple"/>&nbsp;人 / ADD
                                        <select id="AGECustAge15_80ADD" class="tbselect">                                               
                                        </select>萬
                                    </td>
                                    <td class="tableData" style="width: 150px;">
                                        / MR<select id="AGECustAge15_80MR" class="tbselect">
                                        </select>萬        
                                    </td>   
                                    <td class="tableData">
                                      / 海突住院<select id="AGECustAge15_80OS" class="tbselect">                                         
                                      </select>萬
                                    </td>  
                                    <td class="tableData"><input id="15_80PRJBtn" type="button" class="button36big" value="<s:text name="button.add"/>"></td>
                                </tr>   
                                <tr>
                                    <td class="tableData" style="width: 270px;">
                                        <FONT color="#ff0000">*</font>80足歲以上<s:textfield id="AGECustAge80cnt" name="AGECustAge80cnt" style="text-align: right; width: 25px;" maxlength="3" cssClass="textheavy"  theme="simple"/>&nbsp;人 / ADD
                                        <select id="AGECustAge80ADD" class="tbselect">                                               
                                        </select>萬
                                    </td>
                                    <td class="tableData" style="width: 150px;">
                                        / MR<select id="AGECustAge80MR" class="tbselect">
                                        </select>萬        
                                    </td>   
                                    <td class="tableData">
                                      / 海突住院<select id="AGECustAge80OS" class="tbselect">                                       
                                      </select>萬
                                    </td>  
                                    <td class="tableData"><input id="80PRJBtn" type="button" class="button36big" value="<s:text name="button.add"/>"></td>
                                </tr>                                  
                         </tbody>       
                    </table>
                     <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="7"><div align="left">&nbsp;<s:text name="方案資料"/></div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>                           
                         <thead>
                                <tr>
                                    <td class="tableSubhead" width="3%"><s:text name="label.Proj.delete"/>&nbsp;</td><!--刪除-->
                                    <td class="tableSubhead" width="15%"><s:text name="label.Proj.projNm"/>&nbsp;</td><!--方案名稱-->
                                    <td class="tableSubhead" width="10%"><s:text name="label.Proj.projAge"/>&nbsp;</td><!--投保年齡-->
                                    <td class="tableSubhead" width="27%"><s:text name="label.Proj.payItemNm"/>&nbsp;</td><!--給付項目 -->
                                    <td class="tableSubhead" width="15%"><s:text name="label.Proj.insAmt"/>&nbsp;</td><!--保額-->
                                    <td class="tableSubhead" width="10%"><s:text name="label.Proj.projCustCnt"/>&nbsp;</td><!--人數-->                                    
                                    <td class="tableSubhead" width="10%"><s:text name="label.Proj.PInFee"/>&nbsp;</td><!--每人保費-->
                                    <td class="tableSubhead" width="10%"><s:text name="label.Proj.TInFee"/>&nbsp;</td><!--合計保費-->                                    
                                </tr>
                            </thead>
                            <tbody id="projTbody">
                            </tbody>
                        </table>                                                   
 
                    <div id="div-page2" align="left" ><!--style="display: none"-->
                        <!--table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" colspan="4"><div align="left">&nbsp;<s:text name="label.other"/></div></th>
                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="tableData"><FONT color="#ff0000">&nbsp;&nbsp;&nbsp;</FONT>
                                        <s:text name="label.incomeUsrNote"/>&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td class="tableData" colspan="4">
                                        <s:textarea id="incomeUsrNote" name="incomeUsrNote" cols="80" rows="3"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tableData"><FONT color="#ff0000">&nbsp;&nbsp;&nbsp;</FONT><s:text name="label.orgMK"/></td>
                                    <td class="tableData">
                                        <s:radio name='appGPAM.orgMK' list="#{'N':getText('label.orgMK.N'), 'Y':getText('label.orgMK.Y')}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table-->
                        <table cellspacing=0 cellpadding=0 width="97%"  border=0>
                            <tbody>
                                <tr>
                                    <td width="720">
                                        <div align="right">
                                            <input id="actn_cancelEdit" type="button" class="button72" value="<s:text name="button.cancelEdit"/>" style="display:none">
                                        </div>
                                    </td>
                                    <td>
                                        <div align="right">
                                            <s:submit id="actn_calc"  key="button.calc" cssClass="button72"/>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--content table item end-->
                </s:form>
                <s:include value="/common/address.jsp" />
                <div class="ui-widget">
                    <div id="validateTips" class="ui-state-error ui-corner-all" style="padding: 0.7em; display:none;">
                        <p style="font-size: 12px;">
                            <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                            <s:text name="message.validationMsg"/><br/>
                        </p>
                        <p id="validateTipsMsg" style="font-size: 12px;">
                        </p>
                    </div>
                </div>
                <div id="delete-confirm" title="<s:text name="delete-confirm.title"/>">
                    <p><s:text name="delete-confirm.text"/></p>
                </div>
            </div>
            <s:include value="/Prdt/Inq_GTL2_Income.jsp" />

        </div>
        <div id="keyin-form" title="<s:text name="dialog.keyin.title"/>" style="text-align: left">
            <table width="98%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" id="keyin_Content_Tb">
                <tbody>
                    <thead>
                        <tr>
                            <th class="tableHeaderLeft" colspan="3">
                                <div id="allPlan"><a href="javascript:dispPlanItem('ALL')"><s:text name="dialog.plan.A"/></a></div>
                                <div id="mPlan"><a href="javascript:dispPlanItem('M')"><s:text name="dialog.plan.M"/></a></div>
                            </th>
                            <th width="30" class="tableHeaderRight">&nbsp;</th>
                        </tr>
                        <tr>
                            <td class="tableSubhead" width="20">&nbsp;</td>
                            <td class="tableSubhead" width="120"><s:text name="label.planNm"/>&nbsp;</td>
                            <td class="tableSubhead" width="250"><s:text name="label.payItemNm"/>&nbsp;</td>
                            <td class="tableSubhead" width="100"><s:text name="label.insAmt"/>&nbsp;</td>
                        </tr>
                    </thead>
                </tbody>
                <tbody id="keyinTbody">
            </table>
        </div>
    </body>
</html>
