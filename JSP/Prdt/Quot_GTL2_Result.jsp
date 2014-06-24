<%-- 
    Document   : Quot_GTL2_Result
    Created on : 2013/6/25, 下午 04:47:13
    Author     : Louie.Zheng
--%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:text name="報價結果"/></title>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/constant_unicode.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/quot_gtl2_result.js"/>"></script>        
        <style>
            .noBackround {
                background-image: none !important;
            }
        </style>   
    </head>
    <body>
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
                        <!--s:url id="url_input" action="quot"/-->
                        <!--s:a href="%{url_input}"-->
                        <s:text name="label.input"/><!--/s:a-->
                    </div>
                    <div id="advancedSearchTabEnd" class="tabInActiveStartRight"></div>
                </div>
            </div>        
             <!--tab items end-->
            <!--content table item start-->
            <!--橫式table-->

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
            <table cellspacing=0 cellpadding=0 width="97%" summary="" border=0>
              
                <tbody>
                    <tr>
                        <td width="600">
                            <div align="right">
                                &nbsp;
                            </div>                                                                                            
                        </td>
                        <td>
                            <div align="right">
                                 <input id="inviteModify"  type="button" key="button.gen_PDF" onClick="javascript:history.back(1)"  Class="button72" value="<s:text name="修改"/>"/>
                            </div>                                                                                            
                        </td>                    
                        <td>
                            <div align="right">
                            <s:include value="/Pdf/GenPDF.jsp"/>
                            </div>                                                                                            
                        </td>    
                        <td>
                            <div align="right">

                            <s:form action="invite" method="post" enctype="multipart/form-data"> 
                                <s:hidden id="agntCDE" name="agntCDE" value="quotresult"/>
                                <s:hidden id="AGECustAge15cnt_h" name="AGECustAge15cnt_h" value="%{AGECustAge15cnt_h}"/>
                                <s:hidden id="AGECustAge15_80cnt_h" name="AGECustAge15_80cnt_h" value="%{AGECustAge15_80cnt_h}"/>
                                <s:hidden id="AGECustAge80cnt_h" name="AGECustAge80cnt_h" value="%{AGECustAge80cnt_h}"/>
                                <s:submit id="actn_invite"  key="button.invite" cssClass="button72" theme="simple"/>
                            </s:form>
                            </div>                                                                                            
                        </td> 
                    </tr>
                </tbody>
              
            </table>                                
        </div>    
    </body>
</html>
