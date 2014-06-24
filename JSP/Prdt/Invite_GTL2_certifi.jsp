<%-- 
    Document   : Invite_GTL2_Input
    Created on : 2013/6/27, 上午 10:44:50
    Author     : Louie.Zheng
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title><s:text name="CPC完成輸入後_業務確認頁"/></title>
        <sx:head />
        <script type="text/javascript" language="JavaScript" src="<s:url value="/public/func_chk.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/constant_unicode.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/validate_common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/invite_gtl2_input.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/common/jquery.fileDownload.js"/>"></script>
        <!--script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/jquery.json-2.3.js"/>"></script-->

        <style>
            #content .ui-tabs-nav {
                padding-left: 0px;
                background: transparent;
                border-width: 0px 0px 1px 0px;
                border-radius: 0px;
                -moz-border-radius: 0px;
                -webkit-border-radius: 0px;
            }
        </style>
    </head>
    <body>
        <!--tab items start (item start right to left)-->

        <!--tab items end-->
        <!--content table item start-->
        <div style="float:left;width:865px;height:420px;border: 0" id="content">
 
           
            <div id="tab-input">
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
                        <FONT color="#ff0000">&nbsp;CPC完成輸入後_業務確認頁</FONT>
                <!--tab items end-->
                <s:form id="invForm" method="post" enctype="multipart/form-data" action="invite_saveData"><!--onsubmit="return validateSubmit();"-->
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
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.agntCD"/>&nbsp;
                                </td>
                                <td class="tableData" width="25%">
                                    <!--sx:autocompleter id="agntCD" list="%{agntCDMap.values}" listValue="agntCD" listKey="agntCD" keyName="appM.agntCD"
                                                      autoComplete="true" emptyOption="true" valueNotifyTopics="changeAgntCD" resultsLimit="100" cssStyle="{width:120}"/-->
                                    <s:if test="%{agntCDE =='quotresult'}">
                                    <select id="agntCD" name="agntCDMap.agntCD">
                                        <option>A0020G04</option>
                                    </select>
                                    </s:if>
                                    <s:else>
                                     <select id="agntCD" name="agntCDMap.agntCD">
                                        <option>A0020G04</option>
                                    </select>                                       
                                    </s:else>
                                </td>                  
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.issueBrhCD"/>&nbsp;
                                </td>
                                <td class="tableData" width="25%">
                                    <s:textfield id="issueBrhCD" name="appM.issueBrhCD" maxlength="2" cssStyle="{width:50}"  theme="simple" cssClass="textheavy" value="00001"/>
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
                                    <s:textfield id="custNm" name="applicant.custNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px" value="王曉明"/>
                                    <input id="searchCutBtn" type="button" class="button100big" value="<s:text name="button.Cust.search"/>">
                                </td> 
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.birthday"/></td>

                                <td class="tableData">          
                                    <input type="radio" name="BirthY" id="BirthAD" value="AD"/><s:text name="西元"/>&nbsp;<s:textfield id="custBth" name="applicant.custBth" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px" value="1988/08/05"/>
                                    <br>
                                    <br>
                                    <input type="radio" name="BirthY" id="BirthTW" checked value="TW"/><s:text name="民國"/>&nbsp;<s:textfield id="custBthTW" name="applicant.custBthTW" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px" value="77/08/05"/>
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
                                    <s:textfield id="custNm" name="applicant.custNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px" value="B234567899"/>
                                    <input id="searchCutBtn2" type="button" class="button100big" value="<s:text name="button.Cust.search"/>">
                                </td> 
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.telephone"/></td>
                                <td class="tableData">
                                    <s:textfield id="custTEL" name="applicant.custTEL" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="02-26580001"/>
                                </td>                                 
                            </tr>   

                            <!--聯絡地址-->
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.Addr"/>               
                                    <input id="addressBtn" type="button" class="button36big" value="<s:text name="button.quick"/>" >
                                </td>
                                <td class="tableData" width="25%">
                                    <s:textfield id="invZipCD" name="custD.custZipCD" maxlength="10" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 50px" value="10551"/>
                                    <s:textfield id="invAdrs" name="custD.custAdrs" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="台北市敦化北路56號"/>
                                </td>
                                <td class="tableSubhead" width="25%">&nbsp;&nbsp;&nbsp;<s:text name="label.invite.EMail"/></td>
                                <td class="tableData" width="25%">
                                    <s:textfield id="custEMail" name="applicant.custEMail" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="Wang@zuich.com"/>
                                </td>                                 
                            </tr>  
                            <!--代表人-->
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    &nbsp;&nbsp;&nbsp;<s:text name="代表人"/>
                                </td>
                                <td class="tableData">
                                    <div></div>
                                    <s:textfield id="custAgent" name="applicant.custAgent" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="王曉明"/>
                                </td> 
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="身分別"/></td>
                                <td class="tableData">
                                    <input type="radio" name="appGPAM.identity" id="typeLaw" value="Y"/>
                                    <s:text name="法人"/>&nbsp;
                                    <input type="radio" name="appGPAM.identity" id="typeNatu" value="N" checked="true"/>
                                    <s:text name="自然人"/>&nbsp;
                                </td>                                 
                            </tr> 
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="國別"/>
                                </td>
                                <td class="tableData">
                                   <input type="radio" name="appGPAM.Nation" id="typeLaw" value="Y" checked="true"/>
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
                                                                                     
                                    </div>  
                                    <FONT color="#ff0000">*USER輸入起始日時及天數後系統自動計算迄日時，以24小時計。</FONT>
                                </td> 
                            </tr> 
                            
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
                        </tbody>   
                    </table>                                
                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" colspan="4"><div align="left">&nbsp;<s:text name="label.ins.custD"/></div></th>
                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="被保險人名稱"/>
                                    </td>  
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="被保險人ID"/>
                                    </td>          
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="被保險人生日"/>
                                    </td>  
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="英文姓名"/>
                                    </td>    
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="護照號碼"/>
                                    </td>                                     
                                </tr> 
                                 <tr>
                                    <td class=tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurNm" name="applicant.InsurNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="王曉明"/>
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurID" name="applicant.InsurID" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="B234567899"/>
                                    </td>          

                                    <td class="tableData" style="border-right: #8ed8f8 1px solid;">          
                                        <input type="radio" name="InsBirthY" id="InsBirthAD" value="AD"/><s:text name="西元"/>&nbsp;<s:textfield id="InscustBth" name="applicant.custBth" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px" value="1985/08/05"/>
                                        <br>
                                        <br>
                                        <input type="radio" name="InsBirthY" id="InsBirthTW" checked value="TW"/><s:text name="民國"/>&nbsp;<s:textfield id="InscustBthTW" name="applicant.custBthTW" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px" value="74/08/05"/>
                                    </td>                                    
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurENm" name="applicant.InsurENm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="Eson Wang"/>
                                    </td>    
                                    <td class="tableData" width="20%" >
                                        <s:textfield id="InsurPP" name="applicant.InsurPP" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="P1111111111"/>
                                    </td>                                     
                                </tr>   
                                <tr>
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="ADD保額"/>
                                    </td>  
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="MR保額"/>
                                    </td>          
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="HAR保額"/>
                                    </td>  
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="受益人"/>
                                    </td>    
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="受益人與被保險人關係"/>
                                    </td>                                     
                                </tr>     
                                 <tr>
                                    <td class=tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="ADDInsAmt" name="applicant.ADDInsAmt" >
                                            <option>200</option>
                                        </select>萬元  
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="MRInsAmt" name="applicant.MRInsAmt">
                                            <option>200</option>                                    
                                        </select>萬元
                                    </td>          
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="HARInsAmt" name="applicant.HARInsAmt">
                                            <option>200</option>                                            
                                        </select>萬元
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="beneficiary" name="applicant.beneficiary" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="王大同"/>
                                    </td>    
                                    <td class="tableData" width="20%" >
                                        <select id="beneficiaryRe" name="applicant.beneficiaryRe" >
                                            <option>本人</option>                                          
                                        </select>   
                                    </td>                                     
                                </tr>                                 
                                <tr>
                                    <td  class="tableData" colspan="5"><FONT color="#ff0000"><s:text name="label.ins.note1"/></FONT></td>
                                </tr>
   
                            </tbody>
                       </table>
                    <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">  
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="6"><div align="left">&nbsp;<s:text name="方案資料"/></div></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead> 
                      <thead>
                            <tr>
                                <td class="tableSubhead" width="10%">方案名稱&nbsp;</td><!--方案名稱-->
                                <td class="tableSubhead" width="10%">投保年齡&nbsp;</td><!--投保年齡-->
                                <td class="tableSubhead" width="32%">給付項目&nbsp;</td><!--給付項目 -->
                                <td class="tableSubhead" width="15%">保額&nbsp;</td><!--保額-->
                                <td class="tableSubhead" width="10%">人數&nbsp;</td><!--人數-->                                    
                                <td class="tableSubhead" width="10%">每人保費&nbsp;</td><!--每人保費-->
                                <td class="tableSubhead" width="10%">合計保費  &nbsp;</td><!--合計保費-->                                    
                            </tr>
                        </thead>
                        <tbody id="projTbody">
                             
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
                                    <td class="tableData" width="10%">5</td>
                                    <td class="tableData" width="10%">500</td>
                                    <td class="tableData" width="10%">100</td>
                                </tr>

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
                                                    
                                                        
                                                                                               
                                                    <a id="invForm_" href="/SDSWeb/action/prdt/GTL2/quot_foreEmg.action?appM.emgNo=123">明細</a></td>
                                            </tr>                                           
                                        </table>
                                    </td>    
                                    <td class="tableData" width="10%">5</td>
                                    <td class="tableData" width="10%">500</td>
                                    <td class="tableData" width="10%">100</td>
                                </tr> 
                               
                        </tbody>
                    </table>                                   

           
                                            


                    <div id="div-page3" align="left" ><!--style="display: none"-->
                        
                        <table cellspacing=0 cellpadding=0 width="97%"  border=0>
                            <tbody>
                                <tr>
                                    <td width="650">
                                        <div align="right">
                                            <input id="actn_tmSave"  type="button" key="button.tmSave" Class="button100big"  value="<s:text name="儲存及保費計算"/>"/>
                                        </div>                                                                                            
                                    </td>
                                    <td>
                                        <div align="right">
                                             <input id="actn_KYC"  type="button" key="button.KYC" Class="button72" value="<s:text name="填寫KYC"/>"/>
                                        </div>                                                                                            
                                    </td>    
                                    <td>
                                        <div align="right">
                                            <s:submit id="actn_SumitIns" action="quot_SumitIns" key="button.SumitIns" Class="button72"/>
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
            </div>
            
        </div>
<div id="keyin-form" title="<s:text name=""/>" style="text-align: left">
            <table width="98%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" id="keyin_Content_Tb">
                <tbody>
                    <thead>
                        <tr>
                            <th class="tableHeaderLeft" colspan="3">
                                <div id="allPlan"><s:text name="資料清單"/></a></div>
                                
                            </th>
                            <th width="30" class="tableHeaderRight">&nbsp;</th>
                        </tr>
                        <tr>
                            <td class="tableSubhead" width="12" >選取</td>
                            <td class="tableSubhead" width="12"><s:text name="要保人姓名"/>&nbsp;</td>
                            <td class="tableSubhead" width="12"><s:text name="出生年月日"/>&nbsp;</td>
                            <td class="tableSubhead" width="12"><s:text name="身分證字號"/>&nbsp;</td>
                            <td class="tableSubhead" width="12"><s:text name="連絡電話"/>&nbsp;</td>
                            <td class="tableSubhead" width="20"><s:text name="聯絡地址"/>&nbsp;</td>
                            <td class="tableSubhead" width="20"><s:text name="電子信箱"/>&nbsp;</td>
                            <td class="tableSubhead" width="12"><s:text name="身分別"/>&nbsp;</td>
                                                   
                        </tr>
                    </thead>
                </tbody>
                <tbody id="keyinTbody"><!--用Json組成-->
                    <tr>
                        <td class="tableData" ><input type="radio" id="Cust1" name="CustData" value="Cust1"/></td>
                        <td class="tableData" >王曉明</td>
                        <td class="tableData" >1980/09/18</td>
                        <td class="tableData" >A12345678</td>
                        <td class="tableData" >0911622588</td>
                        <td class="tableData" >新北市三重區</td>
                        <td class="tableData" >jjj@Zuich.com</td> 
                        <td class="tableData" >自然人</td>
                    </tr>   
                    <tr>
                        <td class="tableData" ><input type="radio" id="Cust2" name="CustData" value="Cust2"/></td>
                        <td class="tableData" >汪大東</td>
                        <td class="tableData" >1982/11/20</td>
                        <td class="tableData" >B222222222</td>
                        <td class="tableData" >0912345678</td>
                        <td class="tableData" >台北市大直區</td>
                        <td class="tableData" >LLL@Zurich.com</td> 
                        <td class="tableData" >自然人</td>
                    </tr>                      
                </tbody>    
            </table>
        </div>                        
 
        <div id="keyin-form_tmpS" title="<s:text name="填寫KYC"/>" style="text-align: left">
            <table width="98%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" id="keyin_Content_Tb">
                <tbody>
                    <thead>
                        <tr>
                            <th class="tableHeaderLeft" >
                                <div id="allPlan"><s:text name="說明事項"/></a></div>
                                
                            </th>
                            <th width="30" class="tableHeaderRight">&nbsp;</th>
                        </tr>

                    </thead>
                </tbody>
                <tbody id="keyinTbody_KYC">
                    <tr>
                        <td class="tableData" >一、要保人與被保險人投保目的及需求<input type="radio" id="KYC1Y" name="KYC1" value=""/><s:text name="保障"/>&nbsp;<input type="radio" id="KYC1N" name="KYC1" value=""/>其他<input name="KYC1_Other" /></td><td>&nbsp;</td>
                       
                    </tr>   
                    <tr>
                        <td class="tableData" colspan="2">二、要保人/被保險人財務狀況</td>
                    </tr>   
                    <tr>
                        <td class="tableData" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;被保險人家庭年收入：約新台幣<input type="radio" id="KYC2Y" name="KYC2" value=""/><s:text name="50萬元"/>
                        <input type="radio" id="KYC2Y" name="KYC2_1" value=""/><s:text name="100萬元"/>
                        <input type="radio" id="KYC2Y" name="KYC2_1" value=""/><s:text name="200萬元"/>
                        <input type="radio" id="KYC2Y" name="KYC2_1" value=""/><s:text name="超過200萬元"/>
                        </td>
                    </tr>  
                    <tr>
                        <td class="tableData" colspan="2"">&nbsp;&nbsp;&nbsp;&nbsp;要保人家庭年收入：約新台幣<input type="radio" id="KYC2Y" name="KYC2" value=""/><s:text name="50萬元"/>
                        <input type="radio" id="KYC2Y" name="KYC2_2" value=""/><s:text name="100萬元"/>
                        <input type="radio" id="KYC2Y" name="KYC2_2" value=""/><s:text name="200萬元"/>
                        <input type="radio" id="KYC2Y" name="KYC2_2" value=""/><s:text name="超過200萬元"/></td>
                    </tr>   
                    <tr>
                        <td class="tableData" >三、確認要保人、被保險人與受益人之資料及身分填寫正確?</td>
                        <td class="tableData">&nbsp;<input type="checkbox" name="KYC3" value="KYC3"/><s:text name="已確認"/></td>
                    </tr>                     
                    <tr>
                        <td class="tableData" >四、確認要保人、被保險人之關係，以及被保險人與受益人之關係填寫正確？</td>
                        <td class="tableData">&nbsp;<input type="checkbox" name="KYC4" value="KYC4"/><s:text name="已確認"/></td>
                    </tr>     
                    <tr>
                        <td class="tableData" >五、確認要保人、被保險人瞭解投保目的、保險需求、商品內容、所交保費係用以購買保險商品？</td>
                        <td class="tableData">&nbsp;<input type="checkbox" name="KYC5" value="KYC5"/><s:text name="已確認"/></td>
                    </tr>                       
                    <tr>
                        <td class="tableData" >六、確認要保人、被保險人確實綜合考量財務狀況以及付費能力，與確實評估保險費、保額、險種及保障需求間之適當性？</td>
                        <td class="tableData">&nbsp;<input type="checkbox" name="KYC6" value="KYC6"/><s:text name="已確認"/></td>
                    </tr> 
                    <tr>
                        <td class="tableData" >七、確認被保險人無投保其他保險業之旅行平安保險？</td>
                        <td class="tableData">&nbsp;<input type="checkbox" name="KYC7" value="KYC7"/><s:text name="已確認"/></td>
                    </tr>                    
                    
                </tbody>    
            </table>
        </div>        
    </body>
</html>
