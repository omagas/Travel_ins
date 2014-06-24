<%-- 
    Document   : Invite_GTL2_Result
    Created on : 2011/10/12, 下午 10:25:33
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

    </head>
    <body>
    <s:form id="invForm" method="post" enctype="multipart/form-data" action="invite_Pay"><!--onsubmit="return validateSubmit();"-->        
        <s:hidden id="insuranceDataJSON" name="insuranceDataJSON"/>
        <s:hidden id="insuredInputType" name="insuredInputType"/>
        <div style="float:left;width:890px;height:420px;" id="content">
            <p><font color="white">&nbsp;</font></p>
            <!--tab items start (item start right to left)-->
            <div class="infoTextContRight">
                <h2><span><b><s:text name="label.prdt"/></b></span></h2>
                <div class="tabContRight">
                    <div id="simpleSearchTabStart" class="tabActiveEndRight"></div>
                    <div id="simpleSearchTabText" class="tabActiveTextRight"><s:text name="label.result"/></div>
                    <div id="simpleSearchTabEnd" class="tabActiveStartRight"></div>
                    <div id="advancedSearchTabStart" class="tabInActiveEndRight"></div>
                    <div id="advancedSearchTabText" class="tabInActiveTextRight">
                        <s:url id="url_input" action="invite">
                            <s:param name="appM.chlCD" value="%{appM.chlCD}"/>
                        </s:url>
                        <s:a href="%{url_input}"><s:text name="輸入資料"/></s:a>
                    </div>
                    <div id="advancedSearchTabEnd" class="tabInActiveStartRight"></div>
                </div>
            </div>
            <!--tab items end-->
            <!--content table item start-->
            <!--橫式table-->
            <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                <tbody>
                    <tr>
                        <td class="tableDataFirst"><label><s:text name="label.agntCD"/>：A0020G04</label></td>
                        <td class="tableDataFirst"><label><s:text name="label.issueBrhCD"/>：00001</label></td>
                        <td class="tableDataFirst"><label><s:text name="資料序號"/>：<!--s:property value="appM.dataID"/-->SDSxxxxxxx</label></td>
                        <td class="tableDataFirst">&nbsp;</td>
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
                            <s:text name="王曉明"/> <!--HARD CODE-->    
                        </td> 
                        <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.birthday"/></td>
                        <td class="tableData">          
                            <s:text name="'1988/10/30'"/> <!--HARD CODE-->   
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
                            <s:text name="B234567899"/> <!--HARD CODE--> 
                          </td> 
                        <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.telephone"/></td>
                        <td class="tableData">
                            <s:text name="'0226580001'"/> <!--HARD CODE--> 
                        </td>                                 
                    </tr>   

                    <!--聯絡地址-->
                    <tr>
                        <td class="tableSubhead" width="25%">
                            <FONT color="#ff0000">*&nbsp;</FONT><s:text name="label.invite.Addr"/>               

                        </td>
                        <td class="tableData" width="25%">
                            <s:text name="10551台北市敦化北路56號"/> <!--HARD CODE--> 
                        </td>
                        <td class="tableSubhead" width="25%">&nbsp;&nbsp;&nbsp;<s:text name="label.invite.EMail"/></td>
                        <td class="tableData" width="25%">
                           <s:text name="Wang@zuich.com"/> <!--HARD CODE--> 
                        </td>                                 
                    </tr>  
                    <!--代表人-->
                    <tr>
                        <td class="tableSubhead" width="25%">
                            &nbsp;&nbsp;&nbsp;<s:text name="代表人"/>
                        </td>
                        <td class="tableData">
                           <s:text name="王曉明"/> <!--HARD CODE--> 
                        </td> 
                        <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="身分別"/></td>
                        <td class="tableData">
                            <s:text name="自然人"/> <!--HARD CODE--> 
                        </td>                                 
                    </tr> 

                   <tr>
                        <td class="tableSubhead" width="25%">
                            <FONT color="#ff0000">*&nbsp;</FONT><s:text name="國別"/>
                        </td>
                        <td class="tableData">
                           <s:text name="本國人"/> <!--HARD CODE--> 
                        </td> 
                        <td class="tableSubhead" width="25%"><FONT color="#ff0000">*&nbsp;</FONT><s:text name="與被保險人關係"/></td>
                        <td class="tableData">
                            <s:text name="本人"/> <!--HARD CODE--> 
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
                            <div></div>
                            <s:text name="自西元 2013/07/01 12時起至 西元 2013/07/10 12時止，共計10天"/> <!--HARD CODE-->    
                        </td> 

                    </tr>  
                    <tr>
                        <td class="tableSubhead" width="25%">
                            <FONT color="#ff0000">*&nbsp;</FONT><s:text name="旅遊地點"/>

                        </td>
                        <td class="tableData" colspan="3">
                            <div></div>
                            <s:text name="南歐義大利葡萄牙等"/> <!--HARD CODE-->    
                        </td>                                    
                    </tr>    
                    <tr>
                        <td class="tableSubhead" width="25%">
                            <FONT color="#ff0000">*&nbsp;</FONT><s:text name="旅遊人數"/>

                        </td>
                        <td class="tableData" colspan="3">
                            <div></div>
                            <s:text name="共1人，其中未滿15足歲者0人"/> <!--HARD CODE-->    
                        </td>                                    
                    </tr>                                                                                                         
                </tbody>                                                 
            </table>
            
            <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >                        
               <thead>
                    <tr>
                        <th class="tableHeaderLeft" colspan="6"><div align="left">&nbsp;<s:text name="被保險人資料"/></div></th>
                        <th width="30" class="tableHeaderRight">&nbsp;</th>
                    </tr>
               </thead>
               <tbody>
                   <tr>
                       <td class="tableSubhead">方案</td>
                       <td class="tableSubhead">中文姓名/護照英文姓名</td>
                       <td class="tableSubhead">身分證字號/護照號碼</td>
                       <td class="tableSubhead">出生日期/性別</td>
                       <td class="tableSubhead">指定受益人(關係)</td>
                       <td class="tableSubhead">英文投保證明</td>
                       <td class="tableSubhead">保險費</td>
                   </tr> 
                   <tr>
                       <td class="tableData">自行輸入</td>
                       <td class="tableData">王曉明/Wang</td>
                       <td class="tableData">B234567899 </td>
                       <td class="tableData">1988/10/30<br>男</td>
                       <td class="tableData">法定繼承人</td>
                       <td class="tableData">否</td>
                       <td class="tableData">NT$ 150</td>
                   </tr>     
                   
                   
                   
               </tbody> 
            </table>  
                <div id="div-page3" align="left" ><!--style="display: none"-->
                        
                        <table cellspacing=0 cellpadding=0 width="97%"  border=0>
                            <tbody>
                                <tr>
                                    <td width="600">
                                                                                         
                                    </td>  
                                    <td>
                                        <div align="right">
                                           <input id="inviteModify"  type="button" key="button.gen_PDF" onClick="javascript:history.back(1)"  Class="button72" value="<s:text name="修改"/>"/>
                                        </div>                                                                                            
                                    </td>                                     
                                    <td>
                                        <div align="right">
                                           <input id="gen_PDF"  type="button" key="button.gen_PDF" Class="button72" value="<s:text name="列印要保書"/>"/>
                                        </div>                                                                                            
                                    </td>    
                                    <td>
                                        <div align="right">
                                            <s:submit id="pay_Online"  key="button.pay_Online" Class="button72"/>
                                        </div>                                                                                            
                                    </td>                                      
                                </tr>
                            </tbody>
                        </table>
                    </div>                        
            <!--content table item end-->
        </div>
    </s:form>                                    
    </body>
</html>
