$(function() {
    
    /**initiate begin**/
    getResultExe();
    //$('#incomeTbody').hide();
   
    
    initIntervalDatePicker('incomeDtS', 'incomeDtE');
    initIntervalDatePicker('incomeTDtS', 'incomeTDtE');    
    $('#incomeDtS').datepicker( "option", "maxDate", 0 );
    $('#incomeDtS').datepicker( "option", "minDate", null );
    $('#incomeDtE').datepicker( "option", "maxDate", 0 );
    $('#incomeDtE').datepicker( "option", "minDate", null );

    $('#incomeTDtS').datepicker( "option", "maxDate", 0 );
    $('#incomeTDtS').datepicker( "option", "minDate", null );
    $('#incomeTDtE').datepicker( "option", "maxDate", 0 );
    $('#incomeTDtE').datepicker( "option", "minDate", null );

    $("#actn_qry").click(function() {
                var $incomeTbody = $('#incomeTbody');
                $incomeTbody.empty();        
    });
    
    $("#ResultExecute").change(function() {
        //alert($(this).val());
        var StatusVal=$(this).val();
        if(StatusVal != ''){
            switch (StatusVal){
                case 'R001'://補列印要保書PrintIns
                    var url =  contextPath + '/action/paymnt/PrintIns'; 
                    $(location).attr('href',url);
                    break;
                case 'R002'://保費試算_結果quot_calc
                    var url2 =  contextPath + '/action/prdt/GTL2/quot_calc'; 
                    $(location).attr('href',url2);
                    break;
                
                 case 'R003'://線上要保_輸入quot
                    var url3 =  contextPath + '/action/prdt/GTL2/quot'; 
                    $(location).attr('href',url3);
                    break;      
                    
                 case 'R004'://保費試算_輸入invite
                    var url4 =  contextPath + '/action/prdt/GTL2/invite'; 
                    $(location).attr('href',url4);
                    break;           

                 case 'R005'://複製另一張報價單   
                    var url5 =  contextPath + '/action/prdt/GTL2/invite';
                    $(location).attr('href',url5);
                    break;  
                    
                 case 'R006'://複製另一張報價單   
                    var url6 =  contextPath + '/action/prdt/GTL2/invite_Pay';                     
                    $(location).attr('href',url6);
                    break;                     

            }
        }
    });

//    $("#actn_qry").click(function() {
//        newIncome();
//        cleanTips('queryTips', 'queryTipsMsg');
//        var $dataID = $('#dataID'),
//        $dataIDVerNo = $('#dataIDVerNo'),
//        $inqAgntCD = $('#inqAgntCD'),
//        $insuredCustNm = $('#insuredCustNm'),
//        $applicantCustNm = $('#applicantCustNm'),
//        $insuredCustID = $('#insuredCustID'),
//        $applicantCustID = $('#applicantCustID'),
//        $incomeDtS = $('#incomeDtS'),
//        $incomeDtE = $('#incomeDtE'),
//        $procStatusCD = $('#procStatusCD option:selected'),
//        $requiredFields = $([]).add($dataID).add($dataIDVerNo).add($inqAgntCD).add($insuredCustNm).add($applicantCustNm).add($insuredCustID).add($applicantCustID).add($incomeDtS).add($incomeDtE).add($procStatusCD);
//        
//        var valid = false;
//        $requiredFields.each(function(){
//            if(!valid){
//                valid = $.trim($(this).val()).length > 0;
//            }
//        });
//
//        if(valid){
//            var url = contextPath + '/action/prdt/GTL2/quot_query';
//            $.post( url, { 
//                'qryAppIncomeDtParam.dataID' : $dataID.val(),
//                'qryAppIncomeDtParam.dataIDVerNo' : $dataIDVerNo.val(),
//                'qryAppIncomeDtParam.procStatusCD' : $procStatusCD.val(),
//                'qryAppIncomeDtParam.agntCD' : $inqAgntCD.val(),
//                'qryAppIncomeDtParam.insuredCustNm' : $insuredCustNm.val(),
//                'qryAppIncomeDtParam.applicantCustNm' : $applicantCustNm.val(),
//                'qryAppIncomeDtParam.insuredCustID' : $insuredCustID.val(),
//                'qryAppIncomeDtParam.applicantCustID' : $applicantCustID.val(),
//                'qryAppIncomeDtParam.incomeDtS' : $incomeDtS.val(),
//                'qryAppIncomeDtParam.incomeDtE' : $incomeDtE.val()
//            },
//              function( qryAppIncomeDtList) {
//                var isEmpty=true; 
//                var $incomeTbody = $('#incomeTbody');
//                $incomeTbody.empty();
//                $.each(qryAppIncomeDtList, function(index, value){
//                    isEmpty=false;
//                    var $TR = $('<tr></tr>');
//                    //$TR.append('<td><a href="'+contextPath +'/action/prdt/PLL/quot_chgPrm?inqDataId='+value.dataID+'">'+value.dataID+'</a></td>');
//                    $TR.append('<td>'+value.dataID+'</td>');
//                    $TR.append('<td>'+value.insuredNm+'</td>');
//                    $TR.append('<td>'+value.insEffDt+'</td>');
//                    $TR.append('<td>'+value.incomeDt+'</td>');
//                    $TR.append('<td>'+value.totPrm+'</td>');
//                    $TR.append('<td>'+value.procStatusNm+'</td>');
//
//                    var sperator = '||';
//                    var execCDArr = value.execCD.split(sperator);
//                    var execDescArr = value.execDesc.split(sperator);
//                    var statusCD = $('<select id="statusCD" name="statusCD" onchange="javascript:changeOption(this)"></select>');
//                    $.each(execCDArr, function(index, value){
//                        if(index == 0){
//                            $TR.data('statusCD', value);
//                        }
//                        var $option = $option = createOption(value, execDescArr[index]);
//                        statusCD.append($option);
//                    });
//                    var $Td = $('<td></td>');
//                    if ($.trim(value.execCD) != ''){
//                        $Td.append('<input id="execBtn" type="button" class="button36big" value="執行" onclick="javascript:execBtn(this)">&nbsp;');
//                        $Td.append(statusCD);
//                    }
//                    $TR.append($Td);
//                    $TR.data('qryAppIncomeDt', value);
//                    $incomeTbody.append($TR);
//                });
//                if(isEmpty){
//                    $incomeTbody.append($('<tr><td class="tableData noBackround"><font color="#ff0000">查無資料!!!</font></td></tr>'));
//                }
//              }
//            );
//        }else{
//            updateTips('至少填寫一查詢欄位','queryTips', 'queryTipsMsg');
//        }
//    });
    
    $( "#reason-form" ).dialog({
        autoOpen: false,
        height: 400,
        width: 400,
        modal: true,
        buttons: [
        {
            text: uConfirm,
            click: function() {
                var statusCD = $('#statusCD').data('statusCD');
                var dataIDVer = $('#statusCD').data('dataID');
                if($('#reasonCD').val()==''){
                    alert("請選擇原因!!!");
                }else if(($('#reasonCD').val()=='R02005' || $('#reasonCD').val()=='R03006') 
                          && $.trim($('#reasonDesc').val())=='' ){
                    alert("請輸入其他說明!!!");
                }else{
                    var url =  contextPath + '/action/updateAppPLLM';
                    $.post(url, {
                                 'reasonCD': $('#reasonCD').val(),
                                 'statusCD': statusCD,
                                 'dataID': dataIDVer.split("-")[0],
                                 'reasonDesc': $('#reasonDesc').val(),
                                 'dataIDVerNo': dataIDVer.split("-")[1]
                               },
                    function(data) {
                        alert($.trim(data.msgHTML.split("||")[3]));
                        $("#actn_qry").trigger('click');
                    });
                    $(this).dialog("close");
                }
            }
        },
        {
            text: uCancel,
            click: function() {
                $(this).dialog("close");
            }
        }
        ],
        open: function() {
            var url =  contextPath + '/action/getReasonCd';
            $.post(url, {
                'statusCD': $('#statusCD').data('statusCD')
            },
            function(data) {
                var reasonCdList = data.reasonCdList;
                var $reason = $('#reasonCD');
                $reason.empty();
                $.each(reasonCdList, function(index, value){
                    if(index==0){
                        var $option = createOption('', '---請選擇---');
                        $reason.append($option);
                    }
                    $option = createOption(value.reasonCd, value.reasonDesc);
                    $reason.append($option);
                });
            });
        },
        close: function() {
        }
    });

    $("#actn_clear").click(function() {
        newIncome();
        $('#dataID').val('');
        $('#dataIDVerNo').val('');
        $('#inqAgntCD').val('');
        $('#insuredCustNm').val('');
        $('#applicantCustNm').val('');
        $('#insuredCustID').val('');
        $('#applicantCustID').val('');
        $('#incomeDtS').val('');
        $('#incomeDtE').val('');
        $('#procStatusCD').val('');
        $('#incomeTbody').empty();
    });

    if($('#queryDataId').val().split('-').length > 1){
        $('#dataID').val($('#queryDataId').val().split('-')[0]);
        $('#dataIDVerNo').val($('#queryDataId').val().split('-')[1]);
        if($('#queryTyp').val() == 'Q'){
            $("#actn_qry").trigger('click');
        }else if($('#queryTyp').val() == 'A' || $('#queryTyp').val() == 'E'){
            $('#actn_cancelEdit').show();
            getHtmlTR($('#dataID').val() + '-' + $('#dataIDVerNo').val());
        }
    }
});

function execBtn(editor){
    //var url =  contextPath + '/action/prdt/PLL';
    $('#queryTyp').val('');
    $('#actn_cancelEdit').hide();
    var row = $(editor).parent().parent();
    var statusCD = row.data('statusCD');
    $('#statusCD').data('dataID', row.data('qryAppIncomeDt').dataID);
    $('#statusCD').data('statusCD', statusCD);
    if(statusCD != null){
        switch (statusCD){
            case  "CPY":
                getCust($('#statusCD').data('dataID'));
                $("a[href*='tab-input']").click(); 
                break;
            case  "EDT":
                getHtmlTR($('#statusCD').data('dataID'));
                $("a[href*='tab-input']").click(); 
                break;
            case  "LOG":
            case  "CHG":
                $("#form").after($("<form id='inqform' name='inqform' action='quot_chgPrm' />")
                          .append("<input type='hidden' name='inqDataId' id='inqDataId' />"));
                $('#inqDataId').val($('#statusCD').data('dataID'));
                $("#inqform").submit();
                break;
            case  "VIW":
            case  "INV":
                $("#form").after($("<form id='invForm' name='invform' action='invite_chgPrm' />")
                          .append("<input type='hidden' name='inqDataId' id='inqDataId' />"));
                $('#inqDataId').val($('#statusCD').data('dataID'));
                $("#invForm").submit();
                break;
            case  "R01":
            case  "R02":
            case  "R03":
                $('#reason-form').dialog('open');
                break;
        }
    }
}


function getResultExe() {
    var $ProjNM = $('#ResultExecute');
    $ProjNM.empty();
    var ProjNMList=["","R001||補列印要保書、投保證明、繳費證明","R002||檢視報價結果","R003||檢視要保輸入","R004||修改報價單","R005||複製為另一張報價單","R006||線上付款"]; //Prototype模擬JSON回傳,正式開發再採用AJAX
    //alert(ProjNMList);
                    $.each(ProjNMList, function(index, value){
                        if(index==0) {
                            var $option1 = createOption('', '---請選擇---');
                            $ProjNM.append($option1);
                        }
                        else {
                            $option1 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $ProjNM.append($option1);
                        }
                    });
    
}

function getCust(dataIDVer){
    $('#inputDataId').val(null);//新件
    $('#inputDataIdVerNo').val('0');//新件
    $('#projTbody').empty();
    $('#agntCD').val('');
    $('#issueBrhCD').val('');
    $('#agntCD').removeAttr('disabled');
    $('#issueBrhCD').removeAttr('disabled');
    var url =  contextPath + '/action/getGPACustDetail';
    $.post(url, {
        'dataID': dataIDVer.replace("-","")
    },
    function(data) {
        refreshDt();
        var cust = data.cust;
        $("#custNm").val(cust.custNm);
        $("#custID").val(cust.custID);
        if(cust.custTelO.length > 0){
            $("#custTelOAreaCD").val(cust.custTelO.split("-")[0]);
            $("#custTelONo").val((cust.custTelO.split("-")[1]).split("#")[0]);
            $("#custTelOExt").val(cust.custTelO.split("#")[1]);
        }
        $("#custZipCD").val(cust.custZipCD);
        $("#custAdrs").val(cust.custAdrs);
    });
}

function getHtmlTR(dataIDVer){
    getCust(dataIDVer);
    $('#inputDataId').val(dataIDVer.split("-")[0]);//修改件
    $('#inputDataIdVerNo').val(dataIDVer.split("-")[1]);//修改件
    $("#uploadDataId").val($("#inputDataId").val());//修改件
    getFileUploadList();//修改件//擷取最新上傳檔案清單
    var url =  contextPath + '/action/getGPAHtmlTRList';
    $.post(url, {
        'dataID': dataIDVer.split("-")[0],
        'dataIDVerNo': dataIDVer.split("-")[1]
    },
    function(data) {
        var projHtmlTRList = data.projHtmlTRList;
        var $projTbody = $('#projTbody');
        $projTbody.empty();
        $.each( projHtmlTRList, function(index,value){
            $projTbody.append(value.split("@@")[0]+$deleter
                             +value.split("@@")[1].replace(/tdno/g,'td class="tableData noBackround"')
                                                  .replace(/Div/g,'input type="hidden"'));
        });
        $('#projTbody tr[level="1"]').each(function(){
            //get value from <Div/>
            $('#agntCD').val($.trim($(this).find('[id=agntCD]').val()));
            $('#issueBrhCD').val($.trim($(this).find('[id=issueBrhCD]').val()));
            $('#agntCD').attr('disabled', true);
            $('#issueBrhCD').attr('disabled', true);
            $('#oriVerNo').val($(this).find('[id=oriVerNo]').val());
            $("#from").val($(this).find('[id=InsEffDt]').val());
            $("#to").val($(this).find('[id=InsExpDt]').val());
            $("#tm").val($(this).find('[id=tm]').val());
            $("#tm1").val($(this).find('[id=tm1]').val());
            $("#appGPAMBusKindCD").val($(this).find('[id=appGPAMBusKindCD]').val());
            $("#buskindCD").val($(this).find('[id=appGPAMBusKindCD]').val());
            $('#clmRecMK'+$(this).find('[id=clmRecMK]').val()).click();
            $('#clmRecDesc').val($.trim($(this).find('[id=clmRecDesc]').val()));
            $('#incomeUsrNote').val($.trim($(this).find('[id=incomeUsrNoteHtml]').val()));
            $('#suitMK'+$(this).find('[id=suitMK]').val()).attr('checked',true);
            tmpSuitMK = $(this).find('[id=suitMK]').val();
            $('#rateType'+$(this).find('[id=rateType]').val()).click();
            $('#form_appGPAM_orgMK'+$(this).find('[id=orgMK]').val()).click();
            $('#form_appGPAM_payMode'+$(this).find('[id=payMode]').val()).click();
            $(this).data('jobType',$(this).find('[id=jobType]').val());
            $(this).data('classType',$(this).find('[id=classType]').val());
            $(this).data('underAge15',$(this).find('[id=underAge15]').val());
            $(this).data('custCnt',$(this).find('[id=custCnt]').val());
            $(this).data('projKey',$(this).find('[id=projKey]').val());
            //delete <Div/>
            $(this).find('[id=agntCD]').remove();
            $(this).find('[id=issueBrhCD]').remove();
            $(this).find('[id=oriVerNo]').remove();
            $(this).find('[id=InsEffDt]').remove();
            $(this).find('[id=InsExpDt]').remove();
            $(this).find('[id=tm]').remove();
            $(this).find('[id=tm1]').remove();
            $(this).find('[id=appGPAMBusKindCD]').remove();
            $(this).find('[id=clmRecMK]').remove();
            $(this).find('[id=clmRecDesc]').remove();
            $(this).find('[id=incomeUsrNoteHtml]').remove();
            $(this).find('[id=suitMK]').remove();
            $(this).find('[id=rateType]').remove();
            $(this).find('[id=orgMK]').remove();
            $(this).find('[id=payMode]').remove();
            $(this).find('[id=jobType]').remove();            
            $(this).find('[id=classType]').remove();
            $(this).find('[id=underAge15]').remove();  
            $(this).find('[id=custCnt]').remove();            
            $(this).find('[id=projKey]').remove();
        });
        if(tmpSuitMK=='Y'){
            $('#rateTypeTR').hide();
            $('#projNmTxt').show();
            $('#projCD').show();
        }else{
            $('#rateTypeTR').show();
            $('#projNmTxt').hide();
            $('#projCD').hide();
        }
    });
}

function changeOption(editor){
    var row = $(editor).parent().parent();
    row.data('statusCD', editor.options[editor.selectedIndex].value);
}

function refreshDt(){
    $("#custNm").val('');
    $("#custID").val('');
    $("#custTelOAreaCD").val('');
    $("#custTelONo").val('');
    $("#custTelOExt").val('');
    $("#custZipCD").val('');
    $("#custAdrs").val('');
}

function newIncome(){
    //begin clear all item
    $('#queryTyp').val('');
    $('#actn_cancelEdit').hide();
    $('#inputDataId').val(null);//新件
    $('#inputDataIdVerNo').val('0');//新件
    var d = new Date();
    $("#uploadDataId").val(d.getTime()+($("#uploadId").val()==''?"00000":$("#uploadId").val().substr(5,5)));//新件
    $('#fileUploadList').empty();//新件
    $('#agntCD').val('');
    $('#issueBrhCD').val('');
    $('#agntCD').removeAttr('disabled');
    $('#issueBrhCD').removeAttr('disabled');
    $("#custNm").val('');
    $("#custID").val('');
    $("#custTelOAreaCD").val('');
    $("#custTelONo").val('');
    $("#custTelOExt").val('');
    $("#custZipCD").val('');
    $("#custAdrs").val('');
    $('#from').val('');
    $('#to').val('');
    //GPA item start
    $('#appGPAMBusKindCD').val('');
    $('#buskindCD').val('');
    $('#clmRecMKN').click();
    $('#form_appGPAM_payMode1').click();
    $('#projTbody').empty();
    $('#suitMKY').click();
    $('#jobCD1').val('');
    $('#jobCD2').val('');
    $('#custCnt').val('');
    $('#checkUnderAge15').removeAttr("checked");
    $('#projCD').val('');
    $('#rateTypeI').click();
    $('#incomeUsrNote').val('');
    $('#form_appGPAM_orgMKN').click();
    //GPA item end
    initIntervalDatePicker('from', 'to');
    $('#to').datepicker( "option", "defaultDate", '+1y' );
    domReadonly('from', false);
    domReadonly('to', false);
    domReadonly('tm', true);
    domReadonly('tm1', true);
    //end clear all item
}