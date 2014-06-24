var tmpChgAdjPrmMK = 'N';
var tmpChgKey = '';
$(function() {
    //------- initialize ------------
    initMessageFrom();
    $('#queryDataId').val('');
    $('#queryDataIdStr').text($('#dataID').val()+'-'+($('#dataIDVerNo').val()<10?'0':'')+$('#dataIDVerNo').val());
    $('#histBody').empty();
    calcOriPrm();
    initAct($('#actionCD').val());
    edit('UWI');

    //------- keyup event ----------
    $('#UWUsrNote').keyup(function(){
        if($('#UWUsrNote').val()==$('#UWUsrNoteAfter').val()){
            $("#actn_edit_1").hide();
            $("#actn_clearEdit_1").hide();
        }else{
            $("#actn_edit_1").show();
            $("#actn_clearEdit_1").show();
        }
    });

    //------- click event ----------
    $('#foreign_emg_detail').click(function(){
        var url =  contextPath + '/action/prdt/GTL2/quot_foreEmg.action?appM.emgNo=123';
        window.open(url,'_blank','width=1000,height=600');
        //alert(contextPath);
       
        //href="%{url_input}"
    });
        
    
    $('#actn_inquery').click(function(){
        $("#queryTyp").val('Q');
        $("#queryDataId").val($('#dataID').val()+'-'+($('#dataIDVerNo').val()<10?'0':'')+$('#dataIDVerNo').val());
        $('#actionCD').val(''); 
        $('#resultForm').submit();
    });
    
    $('#actn_UWedit').click(function(){
        $("#queryTyp").val($('#procStatusCD').val()=='G02' ? 'A':'E');
        $("#queryDataId").val($('#dataID').val()+'-'+($('#dataIDVerNo').val()<10?'0':'')+$('#dataIDVerNo').val());
        $('#actionCD').val('')
        $('#resultForm').submit();
    });

    $('#actn_showLog').click(function(){
        edit('LOG');
        $("#actn_showLog").hide();
        $("#actn_hiddenLog").show();
    });

    $('#actn_hiddenLog').click(function(){
        $('#histBody').empty();
        $("#actn_hiddenLog").hide();
        $("#actn_showLog").show();
    });

    $('#actn_edit_1').click(function(){
        $('#actn_edit_2').click();
    });

    $('#actn_edit_2').click(function(){
        if(tmpChgAdjPrmMK=='N' && $('#UWUsrNote').val()==$('#UWUsrNoteAfter').val()){
            alert("可輸入欄位皆未異動!!!");
        }else{
            tmpChgKey = '';
            $('#projTbody').find('[id=adjPrm]').each(function(){
                if($(this).data("oriPrm")!=$(this).val()){
                    tmpChgKey = tmpChgKey+ ',' + $(this).data("updateKey") + $(this).val();
                }
            }); 
            //alert(tmpChgKey.substring(1,300));
            edit('CHG');
        }
    });

    $('#actn_clearEdit_1').click(function(){
        $('#UWUsrNote').val($('#UWUsrNoteAfter').val());
        $("#actn_edit_1").hide();
        $("#actn_clearEdit_1").hide();
    });

    $('#actn_clearEdit_2').click(function(){
        $('#projTbody').find('[id=adjPrm]').each(function(){
            $(this).val($(this).data("oriPrm"));
        });
        tmpChgAdjPrmMK='N';
        $("#actn_edit_2").hide();
        $("#actn_clearEdit_2").hide();
    });

    $('#actn_referral').click(function(){
        if(($('#procStatusCD').val()=='G03' || $('#procStatusCD').val()=='G07') && ($('#suitMK').val()=='N') &&
           (tmpChgAdjPrmMK=='Y' || $('#UWUsrNote').val()!=$('#UWUsrNoteAfter').val())){
            alert("可輸入欄位已有異動,請先執行[確認修改]!!!");
        }else{
            switch ($('#procStatusCD').val()){
                case  "G02":
                case  "G04":
                    $('#actionCD').val('UWB');
                    break;
                case  "G03":
                case  "G08":
                    $('#actionCD').val('UWS');
                    break;
            }
            resetDialog('#reason-form');
            $('#reason-form').dialog('open');
        }
    });

    $('#actn_reqDoc').click(function(){
        if(($('#procStatusCD').val()=='G03' || $('#procStatusCD').val()=='G07') && ($('#suitMK').val()=='N') &&
           (tmpChgAdjPrmMK=='Y' || $('#UWUsrNote').val()!=$('#UWUsrNoteAfter').val())){
            alert("可輸入欄位已有異動,請先執行[確認修改]!!!");
        }else{
            $('#actionCD').val('R01');
            resetDialog('#reason-form');
            $('#reason-form').dialog('open');
        }
    });

    $('#actn_reject').click(function(){
        if(($('#procStatusCD').val()=='G03' || $('#procStatusCD').val()=='G07') && ($('#suitMK').val()=='N') &&
           (tmpChgAdjPrmMK=='Y' || $('#UWUsrNote').val()!=$('#UWUsrNoteAfter').val())){
            alert("可輸入欄位已有異動,請先執行[確認修改]!!!");
        }else{
            $('#actionCD').val('R02');
            resetDialog('#reason-form');
            $('#reason-form').dialog('open');
        }
    });

    $('#actn_confirm').click(function(){
        if(($('#procStatusCD').val()=='G03' || $('#procStatusCD').val()=='G07') && ($('#suitMK').val()=='N') &&
           (tmpChgAdjPrmMK=='Y' || $('#UWUsrNote').val()!=$('#UWUsrNoteAfter').val())){
            alert("可輸入欄位已有異動,請先執行[確認修改]!!!");
        }else{
            edit('CFM');
        }    
    });

    $('#actn_prtQuote').click(function(){
        resetDialog('#pdf-form');
        $('#pdf-form').dialog('open');
    });

    $('#actn_invInput').click(function(){
        $("#resultForm").after($("<form id='invForm' name='invform' action='invite_chgPrm' />")
                        .append("<input type='hidden' name='inqDataId' id='inqDataId' />"));
        $('#inqDataId').val($('#dataID').val()+'-'+($('#dataIDVerNo').val()<10?'0':'')+$('#dataIDVerNo').val());
        $("#invForm").submit();
    });

    $( "#reason-form" ).dialog({
        autoOpen: false,
        resizable: false,
        height: 500,
        width: 550,
        modal: true,
        buttons: [
        {
            text: uConfirm,
            click: function() {
                if($('#reasonCD').val()==''){
                    alert("請選擇原因!!!");
                }else if(($('#reasonCD').val()=='R02005' || $('#reasonCD').val()=='R03006') 
                          && $.trim($('#reasonDesc').val())=='' ){
                    alert("請輸入其他說明!!!");
                }else if(($('#procStatusCD').val()=='G02' && $('#actionCD').val()=='UWB' && $.trim($('#UWUsrCD').val())=='')
                          || ($('#procStatusCD').val()=='G03' && $('#actionCD').val()=='UWS' && $.trim($('#UWUsrCD').val())=='')){
                    alert("請選擇呈送核保員!!!");
                }else{
                    edit($('#actionCD').val());
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
            var url =  contextPath + '/action/getGPAReasonCd';
            $.post(url, {
                'statusCD': $('#actionCD').val()
            },
            function(data) {
                var reasonCdList = data.reasonCdList;
                var $reason = $('#reasonCD');
                $reason.empty();
                $.each(reasonCdList, function(index, value){
                    if(index==0 && $('#actionCD').val()!='UWB' && $('#actionCD').val()!='UWS'){
                        var $option = createOption('', '---請選擇---');
                        $reason.append($option);
                    }
                    if (!($('#procStatusCD').val()=='G02' && value.reasonCd=='R04002') &&
                        !($('#procStatusCD').val()=='G03' && value.reasonCd=='R05002') &&
                        !($('#procStatusCD').val()=='G04' && value.reasonCd=='R04001') &&
                        !($('#procStatusCD').val()=='G08' && value.reasonCd=='R05001') ){
                        $option = createOption(value.reasonCd, value.reasonDesc);
                        $reason.append($option);
                    }
                });
            });
            $("#UWUsr").hide();
            if(($('#procStatusCD').val()=='G02' && $('#actionCD').val()=='UWB')
                    || ($('#procStatusCD').val()=='G03' && $('#actionCD').val()=='UWS')){
                $("#UWUsr").show();   
                url =  contextPath + '/action/getGPAUWUsrCdList';
                $.post(url, {
                    'dataID'      : $('#dataID').val(),
                    'dataIDVerNo' : $('#dataIDVerNo').val()
                },
                function(data) {
                    var UWUsrCdList = data.UWUsrCdList;
                    var $UWUsr = $('#UWUsrCD');
                    var Ucnt = 0;
                    var Mcnt = 0;
                    $UWUsr.empty();
                    $.each(UWUsrCdList, function(index, value){
                        if(value.split("||")[2]=='U'){
                            Ucnt = Ucnt + 1;
                        }else if(value.split("||")[2]=='M'){
                            Mcnt = Mcnt + 1;
                        }    
                    });
                    $.each(UWUsrCdList, function(index, value){
                        if((index==0) && ((Ucnt>1) || (Ucnt==0 && Mcnt>1))){
                            var $option = createOption('', '---請選擇---');
                            $UWUsr.append($option);
                        }
                        if((Ucnt==0) || (Ucnt>0 && value.split("||")[2] == 'U')){
                            $option = createOption(value.split("||")[0], value.split("||")[1]);
                            $UWUsr.append($option);
                        }
                    });
                });               
            }
        },
        close: function() {
            $("#UWUsr").show();
        }
    });

    $("#pdf-form").dialog({
        autoOpen: false,
        resizable: false,
        height: 450,
        width: 550,
        modal: true,
        buttons: [
        {
            text: uConfirm,
            click: function() {
                if($('#pdfTitle').val()==''){
                    alert("請輸入敬啟者!!!");
                }else{
                    var url =  contextPath + '/action/prdt/GPA/quot_showPDF';
                    $.fileDownload(url, {httpMethod: 'POST', data: {'appGPAM.dataID'      : $('#dataID').val(),
                                                                    'appGPAM.dataIDVerNo' : $('#dataIDVerNo').val(),
                                                                    'pdfTitle'            : $('#pdfTitle').val(),
                                                                    'actionCD'            : 'PRT',
                                                                    'formTyp'             : 'GPA01'}});
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
            var url =  contextPath + '/action/getGPAPDFTitle';
            $.post(url, {
                'dataID'      : $('#dataID').val(),
                'dataIDVerNo' : $('#dataIDVerNo').val()
            },
            function(data) {
                $('#pdfTitle').val(data.msgHTML);
            });
        },
        close: function() {
        }
    });
});

function initMessageFrom() {
    $( '#message-confirm' ).dialog({
        autoOpen: false,
        resizable: false,
        width: 300,
        height: 250,
        modal: true,
        buttons: [
        {
            text: uConfirm,
            click: function() {
                $(this).dialog( "close" );
            }
        }
        ],
        close: function() {
        }
    });
}

function edit(act_cd) {
    if(act_cd != 'UWI' && act_cd != 'LOG'){
        disabledBtn();
    }
    var tmpReasonDesc = '||';
    if(($('#procStatusCD').val()=='G02' && $('#actionCD').val()=='UWB')
       || ($('#procStatusCD').val()=='G03' && $('#actionCD').val()=='UWS')){
        tmpReasonDesc = $('#UWUsrCD').val()+'||';
    }
    $('#actionCD').val(act_cd);
    var url = contextPath + '/action/prdt/GPA/quot_edit';
    $.post(url, {
        "appGPAM.dataID": $('#dataID').val(),
        "appGPAM.dataIDVerNo": $('#dataIDVerNo').val(),
        "appGPAM.totPrm": $('#totPrm').val(),
        "appGPAM.adjProjPrm": tmpChgKey,
        "actionCD": $('#actionCD').val(),
        "appGPAM.UWUsrNote": $('#UWUsrNote').val(),
        'appGPAM.implItemCD': $('#reasonCD').val(),
        'appGPAM.ReasonDesc': tmpReasonDesc + $('#reasonDesc').val()
    },
    function(msgHTML) {
        if(act_cd=='UWI'){
            $('#UWInfoBody').empty();
            //if($("#actn_hiddenUWInfo").is(":visible")){
                $('#UWInfoBody').append(msgHTML==null || msgHTML==''?'<tr><td>無</td></tr>':msgHTML);
            //}
        }else if(act_cd=='LOG'){
            $('#histBody').empty();
            if($("#actn_hiddenLog").is(":visible")){
                $('#histBody').append(msgHTML);
            }
        }else{
            if(act_cd=='CHG' && $.trim(msgHTML.split("||")[0])=='0'){
                $('#UWUsrNoteAfter').val($('#UWUsrNote').val());
                $('#projTbody').find('[id=adjPrm]').each(function(){
                    $(this).data("oriPrm",$(this).val());
                });
                tmpChgAdjPrmMK='N';
            }
            $('#procStatusCD').val($.trim(msgHTML.split("||")[1]));
            $('#referralLvl').val($.trim(msgHTML.split("||")[2]));
            initAct($('#actionCD').val());
            alert($.trim(msgHTML.split("||")[3]));
            if(act_cd=='CHG'){
                edit('UWI');
                edit('LOG');
                getFileUploadList(); //擷取最新上傳檔案清單
                enabledBtn();
            }else{
                //location.reload();
                $("#resultForm").after($("<form id='inqform' name='inqform' action='quot_chgPrm' />")
                                .append("<input type='hidden' name='inqDataId' id='inqDataId' />"));
                $('#inqDataId').val($('#dataID').val()+'-'+($('#dataIDVerNo').val()<10?'0':'')+$('#dataIDVerNo').val());
                $("#inqform").submit();
            }
        }
    });
}

function initAct(act_cd) {
  $('#adjTotPrm').attr('disabled', true);
  $("#UWUsrNote").attr('disabled', true);
  $("#actn_edit_1").hide();
  $("#actn_edit_2").hide();
  $("#actn_clearEdit_1").hide();
  $("#actn_clearEdit_2").hide();
  $("#actn_UWedit").hide();
  $("#actn_referral").hide();
  $("#actn_reqDoc").hide();
  $("#actn_reject").hide();
  $("#actn_confirm").hide();
  $("#actn_prtQuote").hide();
  $("#actn_invInput").hide();
  $("#attachfile").remove('disabled');
  $("#uploadBtn").show();
  switch (act_cd){
   case "CHG":
   case "CFM":
   case "PRT":
     switch ($('#procStatusCD').val()){
        case  "G02"://計價完成
            $('#adjTotPrm').removeAttr('disabled');
            $("#actn_UWedit").show();
            $("#actn_referral").show();
            break;
        case  "G03"://分公司核價中
            enabledCol();
            $('#adjTotPrm').removeAttr('disabled');
            $("#UWUsrNote").removeAttr('disabled');
            $("#actn_UWedit").show();
            $("#actn_referral").show();
            $("#actn_reqDoc").show();
            $("#actn_reject").show();
            break;
        case  "G04"://分公司要求補件
            $("#actn_referral").show();
            break;
        case  "G07"://總公司核價中
            enabledCol();
            $('#adjTotPrm').removeAttr('disabled');
            $("#UWUsrNote").removeAttr('disabled');
            $("#actn_UWedit").show();
            $("#actn_reqDoc").show();
            $("#actn_reject").show();
            break;
        case  "G08"://總公司要求補件
            $("#actn_referral").show();
            break;
        case  "G06"://分公司完成核價
        case  "G10"://總公司完成核價
        case  "G11"://完成報價
        case  "G13"://要保輸入
            $("#actn_prtQuote").show();
            var roleNum=eval($('#roleLevel').val());
            if(roleNum==1 || roleNum==3 || roleNum==5 || roleNum==7){
                $("#actn_invInput").show();
            }
     }
     
     switch ($('#procStatusCD').val()+$('#referralLvl').val()){
        case  "G02-":
        case  "G03-":
        case  "G03B":
        case  "G07-":
        case  "G07B":
        case  "G07S":
            $("#actn_confirm").show();
     }
  }
  //判斷是否可執行檔案上傳
  switch ($('#procStatusCD').val()){
     case  "G06"://分公司完成核價
     case  "G10"://總公司完成核價
     case  "G11"://完成報價
     case  "G01"://自動拒保
     case  "G05"://分公司拒保
     case  "G09"://總公司拒保
     case  "G12"://敗北
         $("#attachfile").attr('disabled',true);
         $("#uploadBtn").hide();
  }
}

function disabledBtn() {
    $('#adjTotPrm').attr('disabled', true);
    $("#UWUsrNote").attr('disabled', true);
    $("#actn_edit_1").attr('disabled', true);
    $("#actn_edit_2").attr('disabled', true);
    $("#actn_clearEdit_1").attr('disabled', true);
    $("#actn_clearEdit_2").attr('disabled', true);
    $("#actn_UWedit").attr('disabled', true);
    $("#actn_referral").attr('disabled', true);
    $("#actn_reqDoc").attr('disabled', true);
    $("#actn_reject").attr('disabled', true);
    $("#actn_confirm").attr('disabled', true);
    $("#actn_prtQuote").attr('disabled', true);
    $("#actn_invInput").attr('disabled', true);
}

function enabledBtn() {
    $('#adjTotPrm').removeAttr('disabled');
    $("#UWUsrNote").removeAttr('disabled');
    $("#actn_edit_1").removeAttr('disabled');
    $("#actn_edit_2").removeAttr('disabled');
    $("#actn_clearEdit_1").removeAttr('disabled');
    $("#actn_clearEdit_2").removeAttr('disabled');
    $("#actn_UWedit").removeAttr('disabled');
    $("#actn_referral").removeAttr('disabled');
    $("#actn_reqDoc").removeAttr('disabled');
    $("#actn_reject").removeAttr('disabled');
    $("#actn_confirm").removeAttr('disabled');
    $("#actn_prtQuote").removeAttr('disabled');
    $("#actn_invInput").removeAttr('disabled');
}

function resetDialog(dialogNm) {
    if(dialogNm=='#reason-form'){
        $(dialogNm).dialog({resizable:false, height:500, width:550});
    }else if(dialogNm=='#pdf-form'){
        $(dialogNm).dialog({resizable:false, height:450, width:550});
    }
}

function calcPrm(editor,updateKey) {
    if(isNaN($(editor).val())){
        alert("請輸入數字!!!");
        $(editor).val($(editor).data("oriPrm"));
    }
    $(editor).data("updateKey",updateKey);
    var projPrm = 0;
    $(editor).parent().parent().parent().parent().parent().parent().find('[id=adjPrm]').each(function(){
        projPrm = projPrm + eval($(this).val());
    });
    $(editor).parent().parent().parent().parent().parent().parent().find('[id=projPrm]').text('/'+projPrm);
    tmpChgAdjPrmMK='N';
    $('#projTbody').find('[id=adjPrm]').each(function(){
        if($(this).data("oriPrm")!=$(this).val()){
            tmpChgAdjPrmMK='Y';
        }
    });
    if(tmpChgAdjPrmMK=='Y'){
        $('#actn_edit_2').show();
        $('#actn_clearEdit_2').show();
    }else{
        $('#actn_edit_2').hide();
        $('#actn_clearEdit_2').hide();
    }
}

function calcOriPrm() {
    var roleNum=eval($('#roleLevel').val());
    $('#projTbody tr[level="1"]').each(function(){
        var projPrm = 0;
        $(this).find('[id=adjPrm]').each(function(){
            projPrm = projPrm + eval($(this).val());
            $(this).data("oriPrm",$(this).val());
            $(this).attr('disabled', true);
        });
        //if((roleNum==2 || roleNum==4 || roleNum==6) && $('#suitMK').val()=='N'){
        if($('#suitMK').val()=='N'){
            $("#projPrmTH").text('/調整後保費');
            $(this).find('[id=projPrm]').text('/'+projPrm);
        }
    });

    if(roleNum==2 || roleNum==4 || roleNum==6){
    //if((roleNum==2 || roleNum==4 || roleNum==6) && $('#suitMK').val()=='N'){
        $("#planPrmTH").show();
        $('#projTbody').find('[id=planPrmTD]').each(function(){
            $(this).show();
        });
    }else{
        $("#planPrmTH").hide();
        $('#projTbody').find('[id=planPrmTD]').each(function(){
            $(this).hide();
        });
    }
}

function enabledCol() {
    if($('#suitMK').val()=='N'){
        $('#projTbody').find('[id=adjPrm]').each(function(){
            $(this).removeAttr('disabled');
        });
    }
}


