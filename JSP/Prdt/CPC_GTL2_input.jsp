<%-- 
    Document   : CPC_GTL2_input
    Created on : 2013/7/2, 下午 05:40:55
    Author     : Louie.Zheng
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title><s:text name="CPC線上輸入"/></title>
        <sx:head />
        <script type="text/javascript" language="JavaScript" src="<s:url value="/public/func_chk.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/constant_unicode.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/validate_common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/CPC_gtl2_input.js"/>"></script>
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
        <div style="float:left;width:865px;height:420px;border: 0" id="content">
            <div id="tab-input">
                <div class="infoTextContRight">
                    <h2><span><b><s:text name="線上要保"/></b></span></h2>
                    <div class="tabContRight">
                        <div id="advancedSearchTabStart" class="tabInActiveEndRight"></div>
                        <div id="advancedSearchTabText" class="tabInActiveTextRight"><a href="#" class="topnav"><s:text name="label.result"/></a></div>
                        <div id="advancedSearchTabEnd" class="tabInActiveStartRight"></div>
                        <div id="simpleSearchTabStart" class="tabActiveEndRight"></div>
                        <div id="simpleSearchTabText" class="tabActiveTextRight"><s:text name="輸入資料"/></div>
                        <div id="simpleSearchTabEnd" class="tabActiveStartRight"></div>
                    </div>
                </div>
                <s:form id="invForm" method="post" enctype="multipart/form-data" action="invite_CPCF">
                       <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" colspan="5"><div align="left">&nbsp;<s:text name="label.ins.custD"/></div></th>
                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="tableSubhead" width="17%">
                                        <s:text name="輸入方式"/>
                                    </td>
                                    <td class="tableData" colspan="5">
                                          <input type="radio" name="enType" id="enTypeY" value="Y" />
                                          <s:text name="逐筆輸入"/>&nbsp; 
                                          <input type="radio" name="enType" id="enTypeN" value="N" />
                                          <s:text name="簡易輸入"/>&nbsp;    
                                    </td>
                                </tr>
                            </tbody>    
                            <tbody id="TypeStep">
 
                                <tr>
                                    <td class="tableSubhead" width="17%">
                                        <s:text name="被保險人名稱"/>
                                    </td>  
                                    <td class="tableSubhead" width="28%">
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
                                    <td class=tableData" width="17%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurNm" name="applicant.InsurNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    </td>  
                                    <td class="tableData" width="28%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurID" name="applicant.InsurID" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                        <BR>
                                        <BR>
                                        <input id="searchCutBtn" type="button" class="button100big" value="<s:text name="客戶資料查詢"/>">
                                    </td>          
 
                                    <td class="tableData" width="25%" style="border-right: #8ed8f8 1px solid;">         
                                            <input type="radio" name="BirthSTEP" id="BirthADSTEP" value="AD"/><s:text name="西元"/>&nbsp;<s:textfield id="InsurBthStep" name="applicant.custBth" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                            <br>
                                            <br>
                                            <input type="radio" name="BirthSTEP" id="BirthTWSTEP" checked value="TW"/><s:text name="民國"/>&nbsp;<s:textfield id="InsurBthTWStep" name="applicant.custBthTW" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
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
                            <tbody id="TypeSing">
                                <tr>
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="被保險人名稱"/>
                                    </td>  
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="被保險人ID"/>
                                    </td>          
                                    <td class="tableSubhead" width="25%">
                                        <s:text name="被保險人生日"/>
                                    </td>  
                                    <td class="tableSubhead" width="25%" colspan="2">
                                        <s:text name="人數"/>
                                    </td>    
                                    <td class="tableData" width="20%" rowspan="4" style="border-right: #8ed8f8 1px solid;vertical-align:middle">
                                        <input id="15PRJBtnSim" type="button" class="button36big" value="<s:text name="新增"/>">
                                    </td>                                     
                                </tr>
                                
                                 <tr>
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurNmSim" name="applicant.InsurNm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="InsurIDSim" name="applicant.InsurID" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                        <br>
                                        <br>
                                        <input id="searchCutBtn" type="button" class="button100big" value="<s:text name="客戶資料查詢"/>">
                                    </td>          
 
                                    <td class="tableData" width="25%" style="border-right: #8ed8f8 1px solid;">         
                                            <input type="radio" name="BirthY" id="BirthAD" value="AD"/><s:text name="西元"/>&nbsp;<s:textfield id="InsurBthSim" name="applicant.custBth" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                            <br>
                                            <br>
                                            <input type="radio" name="BirthY" id="BirthTW" checked value="TW"/><s:text name="民國"/>&nbsp;<s:textfield id="custBthTW" name="applicant.custBthTW" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 80px"/>
                                    </td>                                      
                                    <td class="tableData" width="25%" style="border-right: #8ed8f8 1px solid;" colspan="2">
                                        <s:text name="等"/><s:textfield id="InsurPeopleSim" name="applicant.InsurENm" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/><s:text name="人"/>
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
                                    <td class="tableSubhead" width="15%">
                                        <s:text name="受益人"/>
                                    </td>    
                                    <td class="tableSubhead" width="20%">
                                        <s:text name="受益人與被保險人關係"/>
                                    </td>                                     
                                </tr>                                
                                <tr>
                                    <td class=tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="ADDInsAmtSim" name="applicant.ADDInsAmt" >
                                            <option>100</option>
                                            <option>200</option>
                                        </select>萬元  
                                    </td>  
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="MRInsAmtSim" name="applicant.MRInsAmt">
                                            <option>100</option>
                                            <option>200</option>                                    
                                        </select>萬元
                                    </td>          
                                    <td class="tableData" width="20%" style="border-right: #8ed8f8 1px solid;">
                                        <select id="HARInsAmtSim" name="applicant.HARInsAmt">
                                            <option>100</option>
                                            <option>200</option>                                            
                                        </select>萬元
                                    </td>  
                                    <td class="tableData" width="15%" style="border-right: #8ed8f8 1px solid;">
                                        <s:textfield id="beneficiarySim" name="applicant.beneficiary" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px" value="法定繼承人"/>
                                    </td>    
                                    <td class="tableData" width="20%"  style="border-right: #8ed8f8 1px solid;">
                                        <select id="beneficiaryReSim" name="applicant.beneficiaryReSim" >
                                            <option>法定繼承人</option>
                                            <option>父子</option>                                            
                                        </select>   
                                                                                                  
                                    </td>                                     
                                </tr>                                 
                             </tbody>                                
                       </table>      
                       <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table">
                            <thead>
                                <tr>
                                    <th class="tableHeaderLeft" ><div align="left">&nbsp;<s:text name="label.InsList"/></div></th>
                                    <th width="30" class="tableHeaderRight">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody id="InsList">    
                            <tbody id="InsList2">     
                            </tbody>                                     
                       </table>  
                 
                       <table cellspacing=0 cellpadding=0 width="97%"  border=0>
                            <tbody>
                                <tr>
                                    <td width="650">
                                        <div align="right">
                                           
                                        </div>                                                                                            
                                    </td>
                                    <td>
                                        <div align="right">
                                             <input id="inviteVerify"  type="button"    Class="button72" value="<s:text name="檢核"/>"/>
                                        </div>                                                                                            
                                    </td>    
                                    <td>
                                        <div align="right">
                                            <s:submit id="actn_SumitIns"  key="輸入完成" Class="button72"/>
                                        </div>                                                                                            
                                    </td>                                     
                                </tr>
                            </tbody>
                        </table> 
                 </s:form>                        
            </div>   
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
