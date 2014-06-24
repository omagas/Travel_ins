<%-- 
    Document   : Quot_GTL2_emergency
    Created on : 2013/6/26, 上午 10:37:32
    Author     : Louie.Zheng
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/public/func_chk.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/constant_unicode.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/common.js"/>"></script>
        <script type="text/javascript" language="JavaScript" src="<s:url value="/js/prdt/validate_common.js"/>"></script>
      
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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>海外急難救助</title>
    </head>
    <body>
        <s:form id="resultForm" method="post" action='quot' enctype="multipart/form-data">
     
                <table width="97%" border="0" cellpadding="4" cellspacing="0" class="table" summary="" >
                        <thead>
                            <tr>
                                <th class="tableHeaderLeft" colspan="1"><div align="left">&nbsp;<s:text name="海外急難救助"/></div></th>
                                <th class="tableHeader" colspan="3">&nbsp;<!--div align="left">&nbsp;<label id="Tour_Label"><s:text name="label.as400CD"/></label>&nbsp;<s:textfield id="as400CD" name="as400CD" cssClass="text" theme="simple" maxLength="10" cssStyle="WIDTH: 80px"/>&nbsp;<input type="button" class="button100big" value="<s:text name="button.as400Qry"/>">&nbsp;<s:text name="label.msg7"/></div--></th>
                                <th width="30" class="tableHeaderRight">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5">
                                    搜索救助：   
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    萬元 / 保費：  
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>  
                                    元   
                                </td>                                
                            </tr>
                            <tr>
                                <td colspan="5">
                                    前往交通：   
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    萬元 / 保費：  
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>  
                                    元   
                                </td>                                
                            </tr>   
                            <tr>
                                <td colspan="5">
                                    前往住膳：   
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    元&nbsp;&nbsp; / 保費：  
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>  
                                    元   
                                </td>                                
                            </tr>    
                            <tr>
                                <td colspan="5">
                                    返國移送：   
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    萬元 / 保費：  
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>  
                                    元   
                                </td>                                
                            </tr>  
                            <tr>
                                <td colspan="5">
                                    子女返國：   
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    萬元 / 保費：  
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>  
                                    元   
                                </td>                                
                            </tr>   
                            <tr>
                                <td colspan="5">
                                    喪葬費用：   
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    萬元 / 保費：  
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>  
                                    元   
                                </td>                                
                            </tr>    
                            <tr>
                                <td colspan="5">
                                    等待返國：   
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>
                                    元 &nbsp;&nbsp;/ 保費：  
                                    <s:textfield id="emgSearch" name="emgSearch" cssClass="textheavy" theme="simple" cssStyle="WIDTH: 120px"/>  
                                    元   
                                </td>                                
                            </tr>                             
                        </tbody>   
                </table>     
        </s:form>
    </body>
    
</html>
