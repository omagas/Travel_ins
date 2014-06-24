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
        <title><s:text name="page.title"/></title>
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
             td.hilight { background: yellow; }
        </style>
    </head>
    <body>
        <!--tab items start (item start right to left)-->
        <div class="infoTextContRight">
            <h2><span><b><s:text name="保經代專區"/></b></span></h2>
            <div class="tabContLeft">
                <div id="advancedSearchTabStart" class="tabInActiveEndLeft"></div>
                <div id="advancedSearchTabText" class="tabInActiveTextLeft"><a href="broker" class="topnav"><s:text name="報價"/></a></div>
                <div id="advancedSearchTabEnd" class="tabInActiveStartLeft"></div>                
                <div id="advancedSearchTabStart" class="tabActiveEndLeft"></div>
                <div id="advancedSearchTabText" class="tabActiveTextLeft"><s:text name="要保"/></div>
                <div id="advancedSearchTabEnd" class="tabActiveStartLeft"></div>
                <div id="simpleSearchTabStart" class="tabInActiveEndLeft"></div>
                <div id="simpleSearchTabText" class="tabInActiveTextLeft"><a href="Inq_broker" class="topnav"><s:text name="查詢"/></div>
                <div id="simpleSearchTabEnd" class="tabInActiveStartLeft"></div>
            </div>
        </div>   
        <!--tab items end-->
        <!--content table item start-->
        <div style="float:left;width:865px;height:420px;border: 0" id="content">
            <ul id="tab-ul" style="margin-top: 0">
                <li><a href="#tab-input"><s:text name="個人投保"/></a></li>
                <li><a href="#tab-excel"><s:text name="Excel檔案上傳投保"/></a></li>
                <li><a href="#tab-query"><s:text name="團體輸入投保"/></a></li>
            </ul>
           
            <div id="tab-input">
 
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
                            <!--姓名-->
                            <tr>
                                <td class="tableSubhead" width="25%">
                                    <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.NM"/>
                                    &nbsp;<s:text name="label.invite.law.NM"/>
                                </td>
                                <td class="tableData">
                                   <s:textfield id="custNm" name="applicant.custNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>                 
                                   <input id="searchCutBtn" type="button" class="button100big" value="<s:text name="button.Cust.search"/>">
                                </td> 
                                <!--生日-->                                
                                <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.birthday"/></td>
                                <td class="tableData">          
                                    <input type="radio" name="BirthY" id="BirthAD" value="AD"/><s:text name="西元"/>&nbsp;<s:textfield id="custBth" name="applicant.custBth" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                    <br>
                                    <br>
                                    <input type="radio" name="BirthY" id="BirthTW" checked value="TW"/><s:text name="民國"/>&nbsp;<s:textfield id="custBthTW" name="applicant.custBthTW" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
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
                                    <s:textfield id="custId" name="applicant.custId" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/> 
                                    <input id="searchCutBtn2" type="button" class="button100big" value="<s:text name="button.Cust.search"/>">
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
                                    <input type="radio" name="appGPAM.tourArea" class="tourArea" id="tourAreaY" value="Y" checked="true"/>
                                    <s:text name="國外"/>&nbsp;
                                    <input type="radio" name="appGPAM.tourArea" class="tourArea" id="tourAreaN" value="N"/>
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
                                    <input type="radio" name="appGPAM.tourArea" class="tourArea" id="tourAreaY" value="Y" />
                                    <s:text name="國外"/>&nbsp;
                                    <input type="radio" name="appGPAM.tourArea" class="tourArea" id="tourAreaN" value="N" checked/>
                                    <s:text name="國內"/>&nbsp;
                                 </p>  
                                    <!--s:select id="tourAreaCD" name="tourAreaCD" list="tourAreaMap.values" listKey="tourAreaCD" listValue="tourAreaNm" emptyOption="true" theme="simple"/-->
                                    <select id="tourAreaCD" class="tbselect"></select>
                                    <s:text name="國家城市/其他地區說明"/>
                                    <!--s:textfield id="rcptZipCD" name="appGPAInv.rcptZipCD" maxlength="10" cssClass="text" theme="simple" cssStyle="WIDTH: 50px"/-->
                                    <s:textfield id="rcptAdrs" name="appGPAInv.rcptAdrs" cssClass="text" theme="simple" cssStyle="WIDTH: 200px"/>
                                    <input id="AddressBtn" type="button" class="button36big" value="<s:text name="button.quick"/>" >                                    
                                </td>            
                            </tr>
                            </s:else>
                        </tbody>   

                    </table>                     
                    <s:if test="%{agntCDE =='quotresult'}"> <!--由報價過來的-->
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
                                                <td class="tableData noBackround" width="15%">10萬元</td>
                                            </tr>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">意外身故或殘廢保險金</td>
                                                <td class="tableData noBackround" width="15%">100萬元</td>
                                            </tr>
                                            <tr>
                                                <td class="tableData noBackround" width="32%">海外醫療保險金</td>
                                                <td class="tableData noBackround" width="15%">200萬元</td>
                                            </tr>                                            <tr>
                                                <td class="tableData noBackround" width="32%">海外突發住院</td>
                                                <td class="tableData noBackround" width="15%">100萬元</td>
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
                                                <input type="radio" name="appGPAM.suitMK" id="suitMKY" value="Y" />
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
                                                    <TD ><select id="optionResponsibility"></select><span>萬元</span></TD>
                                                    <TD rowspan="3" colspan="2" style='border-right-style:dotted; border-right-color:#87ceeb; border-right-width: 1px;'><p><input type="checkbox">特定事故加倍給付</p><p><input type="checkbox">重大燒燙傷</p></TD>
                                                </TR> 
                                                <TR>
                                                    <TD class="tableSubhead">旅行取消</TD>
                                                    <TD><select id="optionCancel" id="">
                                                        </select>萬元
                                                    </TD>
                                                </TR>    
                                                <TR>
                                                    <TD class="tableSubhead"><input type="checkbox">劫機慰問</TD>
                                                    <TD><s:textfield id="" name="" style="text-align: right; width: 25px;" maxlength="3"  theme="simple" value="2" disabled="true"/>萬元</TD>
                                                </TR>
                                                </tbody>
                                                <tbody id="foreign_set">
                                                <TR>
                                                    <TD class="tableSubhead">行李損失</TD>
                                                    <TD ><select id="Packagelost"></select>萬元</TD>
                                                    <TD class="tableSubhead"><input type="checkbox">額外費用</TD>
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
                                    <td class="tableSubhead" width="13%">
                                        <s:text name="英文投保證明"/>
                                    </td>
                                    <td class="tableData" colspan="4">
                                          <input type="radio" name="appGPAM.enEnsur" id="enEnsurY" value="Y" />
                                          <s:text name="是"/>&nbsp; 
                                          <input type="radio" name="appGPAM.enEnsur" id="enEnsurN" value="N" />
                                          <s:text name="否"/>&nbsp;                                         
                                    </td>
                                </tr>  
                                <s:if test="%{AGESum==1}">
                                    
                                    <tr>
                                        <td class="tableSubhead" width="13%">
                                            <s:text name="整單單一保額"/>
                                           
                                        </td>
                                        <td class="tableData" colspan="4">
                                              <input type="radio" name="appGPAM.SinsAmt" id="SinsAmtY" value="Y" />
                                              <s:text name="是"/>&nbsp; 
                                              <input type="radio" name="appGPAM.SinsAmt" id="SinsAmtN" value="N" />
                                              <s:text name="否"/>&nbsp;                                         
                                        </td>
                                    </tr> 
                                </s:if>
                                <tr>
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="被保險人名稱"/>
                                    </td>  
                                    <td class="tableSubhead" width="20%"">
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
                                        <s:textfield id="InsurNm" name="applicant.InsurNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurID" name="applicant.InsurID" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                        <br>
                                        <br>
                                        <input id="searchCutBtn" type="button" class="button100big" value="<s:text name="button.Cust.search"/>">
                                    </td>          
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">          
                                        <input type="radio" name="InsBirthY" id="InsBirthAD" value="AD"/><s:text name="西元"/>&nbsp;<s:textfield id="InscustBth" name="applicant.custBth" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                        <br>
                                        <br>
                                        <input type="radio" name="InsBirthY" id="InsBirthTW" checked value="TW"/><s:text name="民國"/>&nbsp;<s:textfield id="InscustBthTW" name="applicant.custBthTW" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                    </td>                                
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurENm" name="applicant.InsurENm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    </td>    
                                    <td class="tableData" width="20%" >
                                        <s:textfield id="InsurPP" name="applicant.InsurPP" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
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
                                            <option>100</option>
                                            <option>200</option>
                                        </select>萬元  
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="MRInsAmt" name="applicant.MRInsAmt">
                                            <option>100</option>
                                            <option>200</option>                                    
                                        </select>萬元
                                    </td>          
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="HARInsAmt" name="applicant.HARInsAmt">
                                            <option>100</option>
                                            <option>200</option>                                            
                                        </select>萬元
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="beneficiary" name="applicant.beneficiary" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    </td>    
                                    <td class="tableData" width="20%" >

                                        <s:select id="beneficiaryRe" list="#{'1':'本人','2':'父子','3':'母子','4':'子女'}"   theme="simple"  />
                                        <input class="button36big" id="actn_More" type="button" value="更多"/>
                                    </td>                                     
                                </tr>                                 
                                <tr>
                                    <td  class="tableData" colspan="5"><FONT color="#ff0000"><s:text name="label.ins.note1"/></FONT></td>
                                </tr>
                                <tr>
                                    <td class="tableData" colspan="5">
                                        <input id="15PRJBtnA" type="button" class="button36big" value="<s:text name="新增"/>">
                                        <input id="15PRJBtnC" type="button" class="button72" value="<s:text name="清除保額"/>" >
                                    </td>
                                   
                                </tr>    
                            </tbody>
                       </table>
                                            
                       <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" ><div align="left">&nbsp;<s:text name="label.InsList"/></div></th>
                                    <th  class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody id="InsList">           
                            </tbody>                                     
                       </table>

                    <div id="div-page3" align="left" ><!--style="display: none"-->
                        
                        <table cellspacing=0 cellpadding=0 width="97%"  border=0>
                            <tbody>
                                <tr>
                                    <td width="650">
                                        <div align="right">
                                            <input id="actn_tmSave"  type="button" key="button.tmSave" Class="button100big"  value="<s:text name="儲存及計算保費"/>"/>
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
            <s:include value="/Prdt/Invite_GTL2_Input_S.jsp" />
            <s:include value="/Prdt/Invite_GTL_excel.jsp"/>
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
                            <td class="tableSubhead" width="16%"><s:text name="要保人姓名"/>&nbsp;<br><s:text name="(公司名稱)"/></td>
                            <td class="tableSubhead" width="12%"><s:text name="出生年月日"/>&nbsp;</td>
                            <td class="tableSubhead" width="12%"><s:text name="身分證字號"/>&nbsp;<br><s:text name="(統編)"/></td>
                            <td class="tableSubhead" width="12%"><s:text name="連絡電話"/>&nbsp;</td>
                            <td class="tableSubhead" width="20%"><s:text name="聯絡地址"/>&nbsp;</td>
                            <td class="tableSubhead" width="20%"><s:text name="電子信箱"/>&nbsp;</td>
                            <td class="tableSubhead" width="12%"><s:text name="身分別"/>&nbsp;</td>                       
                        </tr>
                    </thead>
                </tbody>
                <tbody id="keyinTbody"><!--用Json組成-->
                    <tr>
                        <td class="tableData" ><input type="radio" id="Cust001" class="Cust00" name="CustData" value="Cust1"/></td>
                        <td class="tableData" >王曉明1</td>
                        <td class="tableData" >1980/09/18</td>
                        <td class="tableData" >A12345678</td>
                        <td class="tableData" >0911622588</td>
                        <td class="tableData" >新北市三重區</td>
                        <td class="tableData" >jjj@Zuich.com</td> 
                        <td class="tableData" >自然人</td>
                    </tr>   
                    <tr>
                        <td class="tableData" ><input type="radio" id="Cust002" class="Cust00" name="CustData" value="Cust2"/></td>
                        <td class="tableData" >汪大東</td>
                        <td class="tableData" >1982/11/20</td>
                        <td class="tableData" >B222222222</td>
                        <td class="tableData" >0912345678</td>
                        <td class="tableData" >台北市大直區</td>
                        <td class="tableData" >LLL@Zurich.com</td> 
                        <td class="tableData" >自然人</td>
                    </tr>   
                    <tr>
                        <td class="tableData" ><input type="radio" id="Cust003" class="Cust00" name="CustData" value="Cust2"/></td>
                        <td class="tableData" >全鹿實業</td>
                        <td class="tableData" >1982/11/20</td>
                        <td class="tableData" >G111111111</td>
                        <td class="tableData" >02-21221212</td>
                        <td class="tableData" >新北市三重區</td>
                        <td class="tableData" >LLL@girafix.com</td> 
                        <td class="tableData" >法人</td>
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
                    
        <div id="Relationform" title="<s:text name=""/>" style="text-align: left">
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
                            
                            <td class="tableSubhead" width="10%"><s:text name="順位"/>&nbsp;</td>
                            <td class="tableSubhead" width="25%"><s:text name="姓名"/>&nbsp;</td>
                            <td class="tableSubhead" width="25%"><s:text name="關係"/>&nbsp;</td>
                            <td class="tableSubhead" width="25%"><s:text name="百分比"/>&nbsp;</td>
                      
                        </tr>
                    </thead>
                </tbody>
                <tbody id="keyinTbody"><!--用Json組成-->
                    <tr>
                        <td class="tableData" > <s:textfield id="Re_position_A" theme="simple" cssStyle="WIDTH: 30px" value="1" disabled="true"/></td>
                        <td class="tableData" > <s:textfield id="Re_name_A" theme="simple" cssStyle="WIDTH: 100px" /></td>
                        <td class="tableData" ><s:select id="Re_section_A" list="#{'1':'本人','2':'父子','3':'母子','4':'子女'}"   theme="simple"  headerKey="-1" headerValue="(保險人與被保險人關係)"/></td>
                        <td class="tableData" ><s:textfield id="Re_percent_A" theme="simple" cssStyle="WIDTH: 100px" />%</td>
                    </tr>   
                    <tr>
                        <td class="tableData" > <s:textfield id="Re_position_B" theme="simple" cssStyle="WIDTH: 30px" /></td>
                        <td class="tableData" ><s:textfield id="Re_name_B" theme="simple" cssStyle="WIDTH: 100px" /></td>
                        <td class="tableData" ><s:select id="Re_percent_B" list="#{'1':'本人','2':'父子','3':'母子','4':'子女'}"   theme="simple"  headerKey="-1" headerValue="(保險人與被保險人關係)"/></td>
                        <td class="tableData" ><s:textfield id="Re_percent_B" theme="simple" cssStyle="WIDTH: 100px" />%</td>
                    </tr>   
                    <tr>
                        <td class="tableData" ><s:textfield id="Re_position_C" theme="simple" cssStyle="WIDTH: 30px" /></td>
                        <td class="tableData" ><s:textfield id="Re_name_C" theme="simple" cssStyle="WIDTH: 100px" /></td>
                        <td class="tableData" ><s:select id="Re_percent_C" list="#{'1':'本人','2':'父子','3':'母子','4':'子女'}"   theme="simple"  headerKey="-1" headerValue="(保險人與被保險人關係)"/></td>
                        <td class="tableData" ><s:textfield id="Re_percent_C" theme="simple" cssStyle="WIDTH: 100px" />%</td>
                    </tr>  
                    <tr>
                        <td class="tableData" ><s:textfield id="Re_position_D" theme="simple" cssStyle="WIDTH: 30px" /></td>
                        <td class="tableData" ><s:textfield id="Re_name_D" theme="simple" cssStyle="WIDTH: 100px" /></td>
                        <td class="tableData" ><s:select id="Re_percent_D" list="#{'1':'本人','2':'父子','3':'母子','4':'子女'}"   theme="simple"  headerKey="-1" headerValue="(保險人與被保險人關係)"/></td>
                        <td class="tableData" ><s:textfield id="Re_percent_D" theme="simple" cssStyle="WIDTH: 100px" />%</td>
                    </tr>                     
                </tbody>    
            </table>
        </div>                    
    </body>
</html>
