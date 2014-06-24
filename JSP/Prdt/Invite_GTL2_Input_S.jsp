<%-- 
    Document   : Invite_GTL2_Input
    Created on : 2013/6/27, 上午 10:44:50
    Author     : Louie.Zheng
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/public/func_chk.js"/>"></script>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/constant_unicode.js"/>"></script>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/common.js"/>"></script>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/validate_common.js"/>"></script>
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/common/jquery.fileDownload.js"/>"></script>
        <!--script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/jquery.json-2.3.js"/>"></script-->    
    <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/invite_gtl2_incomeS.js"/>"></script>

    <div id="tab-query">
                <div class="infoTextContRight">
                    <h2><span><b><s:text name="label.prdt"/></b></span></h2>
                    <div class="tabContRight">
                        <div id="advancedSearchTabStart" class="tabInActiveEndRight"></div>
                        <div id="advancedSearchTabText" class="tabInActiveTextRight"><a href="#" class="topnav"><s:text name="label.result"/></a></div>
                        <div id="advancedSearchTabEnd" class="tabInActiveStartRight"></div>
                        <div id="simpleSearchTabStart" class="tabActiveEndRight"></div>
                        <div id="simpleSearchTabText" class="tabActiveTextRight"><s:text name="輸入資料"/></div>
                        <div id="simpleSearchTabEnd" class="tabActiveStartRight"></div>
                    </div>
                </div>           
                <!--tab items end-->
                <s:form id="invForm" method="post" enctype="multipart/form-data" action="SendCPC"><!--onsubmit="return validateSubmit();"-->
                    <s:hidden id="inputDataId" name="inputDataId"/>
                    <s:hidden id="inputDataIdVerNo" name="inputDataIdVerNo" value='0'/>
                    <s:hidden id="dataID" name="appGPAInv.dataID"/>
                    <s:hidden id="dataIDVerNo" name="appGPAInv.dataIDVerNo"/>                   
                    <s:hidden id="projDataJSON" name="projDataJSON"/>
                    <s:hidden id="appGPAMBusKindCD" name="appGPAM.busKindCD"/>
                    <s:hidden id="procStatusCD" name="appGPAM.procStatusCD"/>
                    <s:hidden id="procStatusDesc" name="procStatusDesc"/>
                    <s:hidden id="actionCD" name="actionCD"/>
                    <s:hidden id="yearDiff" name="yearDiff"/>
                    <s:hidden id="monthDiff" name="monthDiff"/>
                    <s:hidden id="dayDiff" name="dayDiff"/>
                    <!--content table item start-->
                            
                    <!--橫式table-->
                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;</div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">&nbsp;</FONT><s:text name="label.agntCD"/>&nbsp;
                                </td>
                                <td class="tableData" width="26%">
                                    <!--sx:autocompleter id="agntCD" list="%{agntCDMap.values}" listValue="agntCD" listKey="agntCD" keyName="appM.agntCD"
                                                      autoComplete="true" emptyOption="true" valueNotifyTopics="changeAgntCD" resultsLimit="100" cssStyle="{width:120}"/-->
                                   <s:if test="%{agntCDE =='quotresult'}">
                                    <select id="agntCD" name="agntCDMap.agntCD">
                                        <option>A0020G04</option>
                                    </select>
                                    </s:if>
                                    <s:else>
                                     <select id="agntCD" name="agntCDMap.agntCD">
                                        <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    </select>                                       
                                    </s:else>               
                                </td>                  
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.issueBrhCD"/>&nbsp;
                                </td>
                                <td class="tableData" width="25%">
                                    <s:textfield id="issueBrhCD" name="appM.issueBrhCD" maxlength="2" cssStyle="{width:50}"  theme="simple" cssClass="textheavy"/>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                      <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;聯絡人資料</div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">&nbsp;</FONT><s:text name="聯絡人姓名"/>&nbsp;
                                </td>
                                <td class="tableData" width="26%">
                                    <!--sx:autocompleter id="agntCD" list="%{agntCDMap.values}" listValue="agntCD" listKey="agntCD" keyName="appM.agntCD"
                                                      autoComplete="true" emptyOption="true" valueNotifyTopics="changeAgntCD" resultsLimit="100" cssStyle="{width:120}"/-->
                                   <s:textfield id="issueBrhCD" name="appM.issueBrhCD" maxlength="2" cssStyle="{width:120}"  theme="simple" cssClass="textheavy"/>
                                </td>                  
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">&nbsp;</FONT><s:text name="連絡電話/手機"/>&nbsp;
                                </td>
                                <td class="tableData" width="25%">
                                    <s:textfield id="issueBrhCD" name="appM.issueBrhCD" maxlength="2" cssStyle="{width:120}"  theme="simple" cssClass="textheavy"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">&nbsp;</FONT><s:text name="電子郵件"/>&nbsp;
                                </td>
                                <td class="tableData" colspan="3">
                                    <s:textfield id="issueBrhCD" name="appM.issueBrhCD" maxlength="2" cssStyle="{width:200}"  theme="simple" cssClass="textheavy"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>                                  
        
                   <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;旅遊業資料</div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">&nbsp;</FONT><s:text name="服務據點"/>&nbsp;
                                </td>
                                <td class="tableData" width="26%">
                                     <select id="ServiceArea" name="agntCDMap.ServiceArea">
                                        <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    </select> 
                                </td>                  
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">&nbsp;</FONT><s:text name="團號"/>&nbsp;
                                </td>
                                <td class="tableData" width="25%">
                                    <s:textfield id="issueBrhCD" name="appM.issueBrhCD" maxlength="2" cssStyle="{width:120}"  theme="simple" cssClass="textheavy"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>                              
                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;<s:text name="label.custD"/></div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.NM"/>
                                    &nbsp;<s:text name="label.invite.law.NM"/>
                                </td>
                                <td class="tableData">
                                    <div></div>
                                    <s:textfield id="custNmS" name="applicant.custNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                    <input id="searchCutBtnS" type="button" class="button100big" value="<s:text name="客戶資料查詢"/>">
                                </td> 
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.birthday"/></td>
                                <td class="tableData">          
                                    <input type="radio" name="BirthYS" id="BirthADS" value="AD"/><s:text name="西元"/>&nbsp;<s:textfield id="i_custBth" name="applicant.custBth" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                    <br>
                                    <br>
                                    <input type="radio" name="BirthYS" id="BirthTWS" checked value="TW"/><s:text name="民國"/>&nbsp;<s:textfield id="i_custBthTW" name="applicant.custBthTW" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                </td>                                    
                            </tr>  
                            <!--身分證字號-->
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.id"/>
                                    &nbsp;<s:text name="label.invite.law.id"/>
                                </td>
                                <td class="tableData">
                                    <div></div>
                                    <s:textfield id="custIDS" name="applicant.custIDS" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                    <input id="searchCutBtn2S" type="button" class="button100big" value="<s:text name="客戶資料查詢"/>">
                                </td> 
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.telephone"/></td>
                                <td class="tableData">
                                    <s:textfield id="custTEL" name="applicant.custTEL" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                </td>                                 
                            </tr>   

                            <!--聯絡地址-->
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.Addr"/>               
                                    <input id="addressBtn" type="button" class="button36big" value="<s:text name="button.quick"/>" >
                                </td>
                                <td class="tableData" colspan="3">
                                    <s:textfield id="invZipCD" name="custD.custZipCD" maxlength="10" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 50px"/>
                                    <s:textfield id="invAdrs" name="custD.custAdrs" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 500px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tableSubhead" width="25%">&nbsp;&nbsp;&nbsp;<s:text name="label.invite.EMail"/></td>
                                <td class="tableData" colspan="3">
                                    <s:textfield id="custEMail" name="applicant.custEMail" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 300px"/>
                                </td>                                 
                            </tr>  
                            <!--代表人-->
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    &nbsp;&nbsp;&nbsp;<s:text name="代表人"/>
                                </td>
                                <td class="tableData">
                                    <div></div>
                                    <s:textfield id="custAgent" name="applicant.custAgent" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                </td> 
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="身分別"/></td>
                                <td class="tableData">
                                    <input type="radio" name="appGPAM.identity" id="typeLaw" value="Y"/>
                                    <s:text name="法人"/>&nbsp;
                                    <input type="radio" name="appGPAM.identity" id="typeNatu" value="N"/>
                                    <s:text name="自然人"/>&nbsp;
                                </td>                                 
                            </tr> 
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="國別"/>
                                </td>
                                <td class="tableData">
                                   <input type="radio" name="appGPAM.Nation" id="typeLaw" value="Y"/>
                                    <s:text name="本國人"/>&nbsp;
                                    <input type="radio" name="appGPAM.Country" id="typeNatu" value="N"/>
                                    <s:text name="外國人"/>&nbsp;
                                </td> 
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="與被保險人關係"/></td>
                                <td class="tableData">
                                        <select id="Relationship" name="applicant.Relationship" >
                                            <option>本人</option>
                                            <option>父子</option>                                            
                                        </select> 
                                </td>                                 
                            </tr>       

                      
                        </tbody>   

                    </table>                     
                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;<s:text name="旅遊資料"/></div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>                            
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="旅遊期間"/>
                                </td>
                                <td class="tableData" colspan="3">

                                    <div class="demo">

                                        <s:if test="%{agntCDE =='quotresult'}">
                                            <s:text name="label.th1.td1.text1"/>
                                            <s:textfield id="Rfrom" name="appM.insEffDtString" value="2013/07/01" cssClass="textheavy" theme="simple"/>
                                            <s:textfield id="Rtm" name="appM.insEffTM" style="width:25px;text-align:right;" maxlength="2" cssClass="textheavy" theme="simple"/>
                                            <s:text name="時起，"/>    
                                            共 <input id="days" type="text" style="width:25px;text-align:right;" maxlength="2" class="text" value="10"> 天
                                            <br>
                                            <br>
                                            <s:text name="label.th1.td1.text2"/>
                                            <s:textfield id="Rto" name="appM.insExpDtString" value="2013/07/10" cssClass="textheavy" theme="simple"/>
                                            <s:textfield id="Rto_tm" style="width:25px;text-align:right;" maxlength="2" cssClass="textheavy"  theme="simple" value="00"/>
                                            <s:text name="label.th1.td1.text3"/>&nbsp;                                   
                                            <br>
                                            <br>
                                            
                                        </s:if>
                                        <s:else>
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
                                            
                                        </s:else>                                            
                                    </div>  
                                    <FONT color="#ff0000">*USER輸入起始日時及天數後系統自動計算迄日時，以24小時計。</FONT>
                                </td> 
                            </tr> 
                            <s:if test="%{agntCDE =='quotresult'}">
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">* </FONT>
                                    <s:text name="旅遊地點"/>
                                </td>
                                <td class="tableData" colspan="3">
                                 <p>
                                    <input type="radio" name="appGPAM.tourArea" id="tourAreaY" value="Y" checked="true"/>
                                    <s:text name="國外"/>&nbsp;
                                    <input type="radio" name="appGPAM.tourArea" id="tourAreaN" value="N"/>
                                    <s:text name="國內"/>&nbsp;
                                 </p>  
                                    <!--s:select id="tourAreaCD" name="tourAreaCD" list="tourAreaMap.values" listKey="tourAreaCD" listValue="tourAreaNm" emptyOption="true" theme="simple"/-->
                                    <select  class="tbselect">
                                        <option>南歐-義大利葡萄牙等</option>
                                        
                                    </select>
                                    <s:text name="國家城市/其他地區說明"/>
                                    <!--s:textfield id="rcptZipCD" name="appGPAInv.rcptZipCD" maxlength="10" cssClass="text" theme="simple" cssStyle="WIDTH: 50px"/-->
                                    <s:textfield id="rcptAdrs" name="appGPAInv.rcptAdrs" cssClass="text" theme="simple" cssStyle="WIDTH: 200px" value="里斯本"/>
                                    <input id="AddressBtn" type="button" class="button36big" value="<s:text name="button.quick"/>" >                                    
                                </td>            
                            </tr>
                            </s:if>
                            <s:else>                         
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">* </FONT>
                                    <s:text name="旅遊地點"/>
                                </td>
                                <td class="tableData" colspan="3">
                                 <p>
                                    <input type="radio" name="appGPAM.tourArea" class="tourArea_S" id="tourAreaY_S" value="Y"/>
                                    <s:text name="國外"/>&nbsp;
                                    <input type="radio" name="appGPAM.tourArea" class="tourArea_S" id="tourAreaN_S" value="N" checked/>
                                    <s:text name="國內"/>&nbsp;
                                 </p>  
                                    <!--s:select id="tourAreaCD" name="tourAreaCD" list="tourAreaMap.values" listKey="tourAreaCD" listValue="tourAreaNm" emptyOption="true" theme="simple"/-->
                                    <select id="tourAreaCDS" class="tbselect"></select>
                                    <s:text name="國家城市/其他地區說明"/>
                                    <!--s:textfield id="rcptZipCD" name="appGPAInv.rcptZipCD" maxlength="10" cssClass="text" theme="simple" cssStyle="WIDTH: 50px"/-->
                                    <s:textfield id="rcptAdrs" name="appGPAInv.rcptAdrs" cssClass="text" theme="simple" cssStyle="WIDTH: 200px"/>
                                    <input id="AddressBtn" type="button" class="button36big" value="<s:text name="button.quick"/>" >                                   
                                </td>            
                            </tr>
                            </s:else>   
                        </tbody>   
                    </table>
                    <s:if test="%{agntCDE =='quotresult'}">                                 
                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">  
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="6"><div align="left">&nbsp;<s:text name="方案資料"/></div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead> 
                        <thead>
                            <tr>
                                <td class="tableSubhead" width="10%"><s:text name="label.Proj.projNm"/>&nbsp;</td><!--方案名稱-->
                                <td class="tableSubhead" width="10%"><s:text name="label.Proj.projAge"/>&nbsp;</td><!--投保年齡-->
                                <td class="tableSubhead" width="32%"><s:text name="label.Proj.payItemNm"/>&nbsp;</td><!--給付項目 -->
                                <td class="tableSubhead" width="15%"><s:text name="label.Proj.insAmt"/>&nbsp;</td><!--保額-->
                                <td class="tableSubhead" width="10%"><s:text name="label.Proj.projCustCnt"/>&nbsp;</td><!--人數-->                                    
                                <td class="tableSubhead" width="10%"><s:text name="label.Proj.PInFee"/>&nbsp;</td><!--每人保費-->
                                <td class="tableSubhead" width="10%"><s:text name="label.Proj.TInFee"/>&nbsp;</td><!--合計保費-->                                    
                            </tr>
                        </thead>
                        <tbody id="projTbody">
                                <s:if test="%{AGECustAge15cnt_h!=''}">
                                    <tr level="1">
                                    <td class="tableData" width="10%">蘇黎世專案</td>
                                    <td class="tableData" width="10%">~14歲</td>
                                    <td class="tableData" colspan="2" width="67%">
                                        <table>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">個人責任保險</td>
                                                <td class="tableData noBackround" width="15%">3萬元</td>
                                            </tr>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">海外突發住院</td>
                                                <td class="tableData noBackround" width="15%">200萬元</td>
                                            </tr>
                                        </table>
                                    </td>    
                                    <td class="tableData" width="10%"><s:text name="%{AGECustAge15cnt_h}"/></td>
                                    <td class="tableData" width="10%">200</td>
                                    <td class="tableData" width="10%"><s:text name="%{AGECustAge15cnt_h}*200"/></td>
                                   </tr>
                                </s:if>   
                                <s:if test="%{AGECustAge15_80cnt_h!=''}"> 
                                  <tr level="1">
                                    <td class="tableData" width="10%">蘇黎世專案</td>
                                    <td class="tableData" width="10%">15足歲~80足歲</td>
                                    <td class="tableData" colspan="2" width="67%">
                                        <table>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">個人責任保險</td>
                                                <td class="tableData noBackround" width="15%">3萬元</td>
                                            </tr>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">意外身故或殘廢保險金</td>
                                                <td class="tableData noBackround" width="15%">500萬元</td>
                                            </tr>
                                             <tr>
                                                <td class="tableData noBackround" width="32%">海外急難救助</td>
                                                <td class="tableData noBackround" width="15%">
                                                 <s:url id="url_input" action="quot_foreEmg" >
                                                        <s:param name="appM.emgNo" value="123"/>
                                                 </s:url>                                           
                                                 <!--<s:a href="%{url_input}" id="foreign_emg_detail" ><s:text name="明細"/></s:a>--> 
                                                 <s:a href="javascript:void(0)" id="foreign_emg_detail" >明細</s:a>
                                                </td>
                                            </tr>                                           
                                        </table>
                                    </td>    
                                    <td class="tableData" width="10%"><s:text name="%{AGECustAge15_80cnt_h}"/></td>
                                    <td class="tableData" width="10%">300</td>
                                    <td class="tableData" width="10%"><s:text name="%{AGECustAge15_80cnt_h}*300"/></td>
                                   </tr>        
                                 </s:if>  
                                 <s:if test="%{AGECustAge80cnt_h!=''}"> 
                                  <tr level="1">
                                    <td class="tableData" width="10%">蘇黎世專案</td>
                                    <td class="tableData" width="10%">80足歲</td>
                                    <td class="tableData" colspan="2" width="67%">
                                        <table>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">個人責任保險</td>
                                                <td class="tableData noBackround" width="15%">3萬元</td>
                                            </tr>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">意外身故或殘廢保險金</td>
                                                <td class="tableData noBackround" width="15%">500萬元</td>
                                            </tr>
                                             <tr>
                                                <td class="tableData noBackround" width="32%">海外急難救助</td>
                                                <td class="tableData noBackround" width="15%">
                                                 <s:url id="url_input" action="quot_foreEmg" >
                                                        <s:param name="appM.emgNo" value="123"/>
                                                 </s:url>                                           
                                                 <!--<s:a href="%{url_input}" id="foreign_emg_detail" ><s:text name="明細"/></s:a>--> 
                                                 <s:a href="javascript:void(0)" id="foreign_emg_detail" >明細</s:a>
                                                </td>
                                            </tr>                                           
                                        </table>
                                    </td>    
                                    <td class="tableData" width="10%"><s:text name="%{AGECustAge80cnt_h}"/></td>
                                    <td class="tableData" width="10%">500</td>
                                    <td class="tableData" width="10%"><s:text name="%{AGECustAge80cnt_h}*500"/></td>
                                   </tr>                                          
                                   </s:if> 
                            </tbody>                        
                    </table>
                    </s:if>
                    <s:if test="%{agntCDE !='quotresult'}"> <!--由報價過來的-->                            
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
                                                            <input type="radio" name="appGPAM.suitMK" id="suitMKYS" value="Y" />
                                                            <s:text name="label.suit"/>&nbsp;
                                                            <input type="radio" name="appGPAM.suitMK" id="suitMKNS" value="N"/>
                                                            <s:text name="label.keyin"/>&nbsp;
                                                        </p>
                                                        <p id="Proj">
                                                            <select id="ProjNM" name="ProjNM" class="tbselect">
                                                                <option>個人責任保險基本型</option>
                                                            </select> 
                                                            <input id="BrowersuitBtn" type="button" class="button100big" value="<s:text name="button.Browersuit"/>">
                                                            <FONT color="#ff0000">(方案內容預設為：個人責任保險基本型)</FONT>
                                                        </p>
                                                        <p></p>
                                                    </div></div></div></div>
                                                   
                                    </td>
                                    <td class="tableData">&nbsp;</td> 
                                </tr>
                                <tr id="rateTypeTRS">
                                        <td class="tableSubhead"><FONT color="#ff0000">&nbsp;&nbsp;&nbsp;</FONT>    
                                        </td>
                                        <td class="tableData">
                                            <FONT color="#ff0000">下列勾選之各項保險金額適用於每一被保險人</FONT>

                                        <TABLE width="90%" border="0" cellpadding="4" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="tableHeaderLeft" colspan="3"><div align="left">&nbsp;共同投保內容</div></th>
                                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                                </tr>
                                            </thead>                 
                                            <tbody>
                                                    <TR>
                                                        <TD class="tableSubhead">個人責任</TD>
                                                        <TD ><select id="optionResponsibilityS"></select>萬元</TD>
                                                        <TD rowspan="3" colspan="2" style='border-right-style:dotted; border-right-color:#87ceeb; border-right-width: 1px;'><p><input type="checkbox">特定事故加倍給付</p><p><input type="checkbox">重大燒燙傷</p></TD>
                                                    </TR> 
                                                    <TR>
                                                        <TD class="tableSubhead">旅行取消</TD>
                                                        <TD><select id="optionCancelS" id="">
                                                            </select>萬元
                                                        </TD>
                                                    </TR>    
                                                    <TR>
                                                        <TD class="tableSubhead"><input type="checkbox" >劫機慰問</TD>
                                                        <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="2" disabled="true"/>萬元</TD>
                                                    </TR>
                                            </tbody>
                                            <tbody id="foreign_set_S">
                                                    <TR>
                                                        <TD class="tableSubhead">行李損失</TD>
                                                        <TD ><select id="PackagelostS"></select>萬元</TD>
                                                        <TD class="tableSubhead"><input type="checkbox">額外費用</TD>
                                                        <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="3.3" disabled="true"/>萬元</TD>

                                                    </TR> 
                                                    <TR>
                                                        <TD class="tableSubhead">行程更改</TD>
                                                        <TD><select id="SchedulechangeS"></select>萬元</TD>
                                                        <TD class="tableSubhead">行李延誤</TD>
                                                        <TD><select id="PackagedelayS"></select>萬元</TD>
                                                    </TR>    
                                                    <TR>
                                                        <TD class="tableSubhead"><input type="checkbox">食物中毒</TD>
                                                        <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="0.3" disabled="true"/>萬元</TD>
                                                        <TD class="tableSubhead"><input type="checkbox">竊盜損失</TD>
                                                        <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="0.3" disabled="true"/>萬元</TD>
                                                    </TR>
                                                    <TR>
                                                        <TD colspan="2"><input type="checkbox">緊急救援</TD>

                                                        <TD  colspan="2"><input type="checkbox">海外急難救助</TD>

                                                    </TR>  
                                            </tbody>                                            
                                        </TABLE>
                                            <Br>
                                            <Br>
                
                                            
                                          
                                        </td>
                                  </tr>      
                            </tbody>       
                       </table>
                       </s:if>                     
                       <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" colspan="4"><div align="left">&nbsp;<s:text name="label.ins.custD"/></div></th>
                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td class="tableSubhead" width="25%">
                                        <s:text name="英文投保證明"/>
                                    </td>
                                    <td class="tableData" colspan="4">
                                          <input type="radio" name="appGPAM.enEnsur" id="enEnsurY" value="Y" />
                                          <s:text name="是"/>&nbsp; 
                                          <input type="radio" name="appGPAM.enEnsur" id="enEnsurN" value="N" />
                                          <s:text name="否"/>&nbsp;                                         
                                    </td>
                                </tr>  
                                <tr>
                                    <td class="tableSubhead" width="25%">
                                        <s:text name="被保險人名冊上傳"/>
                                    </td>
                                    <td class="tableData" colspan="4">
                                       <s:include value="/common/fileUpload.jsp" />
                                    </td>
                                </tr> 
                            </tbody>
                       </table>
                                            


                    <div id="div-page3" align="left" ><!--style="display: none"-->
                        
                        <table cellspacing=0 cellpadding=0 width="97%"  border=0>
                            <tbody>
                                <tr>
                                    <td width="650">
                                        <div align="right">
                                            
                                        </div>                                                                                            
                                    </td>
                                    <td>
                                        <div align="right">
                                                                   
                                                <s:submit id="actn_CPC" key="轉CPC輸入" cssClass="button100"/>
                                            
                                        </div>                                                                                            
                                    </td>    
                                    <td>
                                        <div align="right">
                                            
                                        </div>                                                                                            
                                    </td>                                     
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--content table item end-->
                </s:form>
                
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
            </div>
                         
</html>
