var alertRemoveAllFlag = false;
var $deleteTR = null;
//var $deleter = '<img alt="delete" src="'+ contextPath +'/Images/button_cancel.png" height="10" width="10" onclick="javascript:deleteTR(this)"/>&nbsp;';
var $deleter = '<input type="button" value="刪除" onclick="javascript:deleteTR(this)"/>&nbsp;';
var tmpSuitMK = '';
var tmpClassType = '';
var tmpSuitClassType = '';
var tmpKeyinClassType = '';

$(function() {
    //------- initialize ------------
    $('#content').tabs();
    initIntervalDatePicker('from', 'to');
    $( '#to' ).datepicker( "option", "defaultDate", '+1y' );
    domReadonly('tm', true);
    domReadonly('tm1', true);

    //------- click event ----------
    
    $('#addressBtn').click(function(){
        zipcodeId = 'custZipCD';
        addressId = 'custAdrs';
        $('#address-form').dialog('open');
    });
    
    $('#clmRecMKN').click(function(){
        $('#clmRecDesc').hide();
        $('#clmRecDesc').val('');
    });

    $('#clmRecMKY').click(function(){
        $('#clmRecDesc').show();
    });
 
    function tourAreacheck(){
        if($('.tourArea:checked').val()=='Y'){        
            $('#foreign_set').show();
        }else{
            $('#foreign_set').hide();
        }        
    }
    
    $('#tourAreaN').click(function(){
        tourAreacheck();
    });

    $('#tourAreaY').click(function(){
        tourAreacheck();
    });

    $('#suitMKN').click(function(){
        tourAreacheck();
        $('#rateTypeTR').fadeIn();
        $('#Proj').hide();
        $('#projNmTxt').hide();
        $('#projCD').hide();
        if(!$('#projTbody').is(':empty') && tmpSuitMK == 'Y'){
            $('#delete-confirm').dialog('open');
        }
    });

    $('#suitMKY').click(function(){
        $('#rateTypeTR').fadeOut();
        $('#Proj').show();
        $('#projNmTxt').show();
        $('#projCD').show();
        if(!$('#projTbody').is(':empty') && tmpSuitMK == 'N'){
            $('#delete-confirm').dialog('open');
        }
    });

    $('#newProjBtn').click(function(){
        disabledBtn();
        var projFlag = 'N';
        if($('#jobCD2').val()==''){
            alert('請選擇工作內容!!!');
        }else if($('#custCnt').val()=='' || $('#custCnt').val()==0){
            alert('請輸入職業類別人數!!!');
        }else if($('#suitMKN').is(':checked')){
            $('#keyin-form').dialog('open');
        }else if($('#suitMKY').is(':checked') && $("#projCD").val()==''){
            alert('請選擇方案!!!');           
        }else{
            $('#projTbody tr[level="1"]').each(function(){
                if($(this).data("projKey") == $("#projCD").val() 
                    && $(this).data("classType") == tmpClassType
                    && $(this).data("underAge15") == ($('#checkUnderAge15').is(':checked')?'Y':'N')){
                    projFlag='Y';
                }
            });
            if(projFlag=='Y'){
                alert('該方案已選擇，請重新選擇方案!!!'); 
            }else{
                getGPAInputTR(($('#suitMKY').is(':checked')?'Y':'N')+$("#projCD").val());
            }  
        }
        enabledBtn();
    });

    $('#actn_cancelEdit').click(function(){
        disabledBtn();
        $("#form").after($("<form id='inqform' name='inqform' action='quot_chgPrm' />")
                  .append("<input type='hidden' name='inqDataId' id='inqDataId' />"));
        $('#inqDataId').val($('#dataID').val()+'-'+($('#dataIDVerNo').val()<10?'0':'')+eval($('#dataIDVerNo').val()));
        $("#inqform").submit();
    });
    
    
    
    $('#15PRJBtn').click(function(){
        var tdCustCnt=$('#AGECustAge15cnt').val();
        $('#AGECustAge15cnt_h').val($('#AGECustAge15cnt').val());
        if(tdCustCnt!=''){        
            var $ADD=$('#AGECustAge15ADD').val();
            var $MR=$('#AGECustAge15MR').val();
            var $OS=$('#AGECustAge15OS').val();
            
            var tdPInFee=250;
            var TInFee=tdPInFee*tdCustCnt;
            var $projTbody = $('#projTbody');           
            var $TR = $('<tr level="1"></tr>');
            var $TR1 = $('<tr></tr>');
            var $TB = $('<table></table>');
            var $TD = $('<td class="tableData" colspan="2" width="67%"></td>');
                  $TR.append('<td class="tableData" width="3%" Style="vertical-align:middle">'+$deleter+'</td>');
                        $TR.append('<td class="tableData" width="10%">蘇黎世專案</td>');
                        $TR.append('<td class="tableData" width="10%">~14歲</td>');
                        $TR1.append('<td class="tableData noBackround" width="32%">個人責任保險</td>');
                        $TR1.append('<td class="tableData noBackround" width="15%">3萬元</td>'); 
                        $TB.append($TR1);

                        if($ADD!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">意外身故或殘廢保險金</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$ADD+'萬元</td>');
                            $TB.append($TR1); 
                        }

                        if($MR!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">海外醫療保險金</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$MR+'萬元</td>');
                            $TB.append($TR1);
                        }

                        if($OS!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">海外突發住院</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$OS+'萬元</td>');
                            $TB.append($TR1);
                        }                   

                        $TD.append($TB);
                        $TR.append($TD);

                        $TR.append('<td class="tableData" width="10%">'+tdCustCnt+'</td>');
                        $TR.append('<td class="tableData" width="10%">'+tdPInFee+'</td>');
                        $TR.append('<td class="tableData" width="10%">'+TInFee+'</td>');
                    
                        $projTbody.append($TR);  
                        
        }                        
    });
    
    
    $('#15_80PRJBtn').click(function(){
        var tdCustCnt=$('#AGECustAge15_80cnt').val();
        $('#AGECustAge15_80cnt_h').val($('#AGECustAge15_80cnt').val());
        if(tdCustCnt!=''){
            var $ADD=$('#AGECustAge15_80ADD').val();
            var $MR=$('#AGECustAge15_80MR').val();
            var $OS=$('#AGECustAge15_80OS').val();

            var tdPInFee=250;
            var TInFee=tdPInFee*tdCustCnt;
            var $projTbody = $('#projTbody');           
            var $TR = $('<tr level="1"></tr>');
            var $TR1 = $('<tr></tr>');
            var $TB = $('<table></table>');
            var $TD = $('<td class="tableData" colspan="2" width="67%"></td>');
                  $TR.append('<td class="tableData" width="3%" Style="vertical-align:middle">'+$deleter+'</td>');
                        $TR.append('<td class="tableData" width="10%">蘇黎世專案</td>');
                        $TR.append('<td class="tableData" width="10%">15~80歲</td>');

                        $TR1.append('<td class="tableData noBackround" width="32%">個人責任保險</td>');
                        $TR1.append('<td class="tableData noBackround" width="15%">3萬元</td>'); 
                        $TB.append($TR1);

                        if($ADD!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">意外身故或殘廢保險金</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$ADD+'萬元</td>');
                            $TB.append($TR1); 
                        }

                        if($MR!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">海外醫療保險金</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$MR+'萬元</td>');
                            $TB.append($TR1);
                        }

                        if($OS!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">海外突發住院</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$OS+'萬元</td>');
                            $TB.append($TR1);
                        }                   

                        $TD.append($TB);
                        $TR.append($TD);

                        $TR.append('<td class="tableData" width="10%">'+tdCustCnt+'</td>');
                        $TR.append('<td class="tableData" width="10%">'+tdPInFee+'</td>');
                        $TR.append('<td class="tableData" width="10%">'+TInFee+'</td>');

                        $projTbody.append($TR); 
        }
    });   
    
    
        $('#80PRJBtn').click(function(){
        var tdCustCnt=$('#AGECustAge80cnt').val();
        $('#AGECustAge80cnt_h').val($('#AGECustAge80cnt').val());
        if(tdCustCnt!=''){
            var $ADD=$('#AGECustAge80ADD').val();
            var $MR=$('#AGECustAge80MR').val();
            var $OS=$('#AGECustAge80OS').val();

            var tdPInFee=250;
            var TInFee=tdPInFee*tdCustCnt;
            var $projTbody = $('#projTbody');           
            var $TR = $('<tr level="1"></tr>');
            var $TR1 = $('<tr></tr>');
            var $TB = $('<table></table>');
            var $TD = $('<td class="tableData" colspan="2" width="67%"></td>');
                  $TR.append('<td class="tableData" width="3%" Style="vertical-align:middle">'+$deleter+'</td>');
                        $TR.append('<td class="tableData" width="10%">蘇黎世專案</td>');
                        $TR.append('<td class="tableData" width="10%">80歲</td>');

                        $TR1.append('<td class="tableData noBackround" width="32%">個人責任保險</td>');
                        $TR1.append('<td class="tableData noBackround" width="15%">3萬元</td>'); 
                        $TB.append($TR1);

                        if($ADD!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">意外身故或殘廢保險金</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$ADD+'萬元</td>');
                            $TB.append($TR1); 
                        }

                        if($MR!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">海外醫療保險金</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$MR+'萬元</td>');
                            $TB.append($TR1);
                        }

                        if($OS!=''){
                            $TR1 = $('<tr></tr>');//"給付項目"，第二行的關鍵
                            $TR1.append('<td class="tableData noBackround" width="32%">海外突發住院</td>');
                            $TR1.append('<td class="tableData noBackround" width="15%">'+$OS+'萬元</td>');
                            $TB.append($TR1);
                        }                   

                        $TD.append($TB);
                        $TR.append($TD);

                        $TR.append('<td class="tableData" width="10%">'+tdCustCnt+'</td>');
                        $TR.append('<td class="tableData" width="10%">'+tdPInFee+'</td>');
                        $TR.append('<td class="tableData" width="10%">'+TInFee+'</td>');

                        $projTbody.append($TR); 
        }
    }); 
    

    //------- change event ----------
    $('#from').change(function(){
        if($('#from').val().split('/')[2] != null){
            $('#to').val((eval($('#from').val().split('/')[0])+1)+'/'+$('#from').val().split('/')[1]+'/'+$('#from').val().split('/')[2]);
        }
    });

    $('#agntCD').change(function(){
        var msg=getGPAAgntCDList($('#agntCD').val());
        if(msg=='N' && $('#agntCD').val()!=''){
            alert("經手人帳號不存在!!!");
            $('#agntCD').val('');
        }
    });

    $("#custID").change(function(){
        $(this).val($(this).val().toUpperCase());
    });
    
    $("#jobCD2").change(function(){
        tmpClassType=$("#jobCD2").val().substr(0,1);
        $("#classTypeTxt").text('第'+tmpClassType+'類 ');
        if(tmpSuitClassType!=tmpClassType){
            getGPASuitProjList();
            tmpSuitClassType=tmpClassType;
        }
    });
    
    $("#checkUnderAge15").change(function(){
        getGPASuitProjList();
    });

    //------- keyup event ----------
    $('#custCnt').keyup(function(){
        if(isNaN($('#custCnt').val())){
            alert("請輸入數字!!!");
            $('#custCnt').val('');
        }
    });


    if($('#queryDataId').val() != '' && $('#queryTyp').val() != 'A' && $('#queryTyp').val() != 'E'){
        $("a[href*='tab-query']").click();
        
    }
    
    $('#clmRecMK'+$("[name='appGPAM.clmRecMK']").val()).click();
    $('#form_appGPAM_payMode'+$("[name='appGPAM.payMode']").val()).click();
    $('#suitMK'+$("[name='appGPAM.suitMK']").val()).attr('checked',true);
    tmpSuitMK = $("[name='appGPAM.suitMK']").val();
    $('#rateType'+$("[name='appGPAM.rateType']").val()).click();
    $('#rateTypeTR').hide();
    $('#form_appGPAM_orgMK'+$("[name='appGPAM.orgMK']").val()).click();
    $('#inputDataId').val(null);//新件
    $('#inputDataIdVerNo').val('0');//新件
    
    initDeleteForm();
    getGPAIssueBrhCDList();
    getGPABuskindCDList();
    $('#buskindCD').val($('#appGPAMBusKindCD').val());
    getGPAJobCDList();

    //------- prototype start ---------       
    getGTL2TourAreaCD(); //旅遊地點下拉選單內容
    getGTL2ProjNM();     //旅遊方案下拉選單內容(目前Hard Code,將來用Ajax處理)
    getGTL2CustAge15();  //輸入年齡層，人數及ADD/MR/HAR投保保額
    getGTL2option();



    //------- prototype end ---------

});

function deleteTR(deleter, dataKey) {
    var $TR = $(deleter).parent().parent();
    if(dataKey != null){
        $TR.parents('table').removeData(dataKey);
    }
    $TR.empty().remove();
}

function initDeleteForm() {
    $( '#delete-confirm' ).dialog({
        autoOpen: false,
        resizable: false,
        width: 220,
        modal: true,
        buttons: [
        {
            text: uDelete,
            click: function() {
                if($('#suitMKY').is(':checked')){
                    tmpSuitMK = 'Y';
                    //$('#projNmTD').show();
                    $('#rateTypeTR').hide();
                    $('#projNmTxt').show();
                    $('#projCD').show();
                }else if($('#suitMKN').is(':checked')){
                    tmpSuitMK = 'N';
                    //$('#projNmTD').hide();
                    $('#rateTypeTR').show();
                    $('#projNmTxt').hide();
                    $('#projCD').hide();
                }                
                $('#projTbody').empty();
                $(this).dialog( 'close' );
            }
        },
        {
            text: uCancel,
            click: function() {
                if(tmpSuitMK == 'Y'){
                    $('#suitMKY').attr('checked',true);
                    $('#rateTypeTR').hide();
                    $('#projNmTxt').show();
                    $('#projCD').show();
                }else if(tmpSuitMK == 'N'){
                    $('#suitMKN').attr('checked',true);
                    $('#rateTypeTR').show();
                    $('#projNmTxt').hide();
                    $('#projCD').hide();
                }
                $(this).dialog( 'close' );
            }
        }
        ],
        close: function() {
        }
    });

    $("#keyin-form").dialog({
        autoOpen: false,
        resizable: false,
        height: 700,
        width: 750,
        modal: true,
        buttons: [
        {
            text: uConfirm,
            click: function() {
                var planCnt=0;
                var amtFlag='Y';
                var projFlag='N';
                var projKey='';
                $('#keyinTbody tr').each(function(){
                    if($(this).find('[id=checkItem]').is(':checked')){
                        if($(this).find('[id=amtCD]').val()==''){
                            amtFlag='N';
                        }
                        planCnt=planCnt+1
                        projKey=projKey+$(this).data('planCD')+$.trim($(this).find('[id=amtCD]').val())+'$';
                    }
                });
                $('#projTbody tr[level="1"]').each(function(){
                    if($(this).data("projKey") == projKey
                        && $(this).data("classType") == tmpClassType
                        && $(this).data("underAge15") == ($('#checkUnderAge15').is(':checked')?'Y':'N')){
                        projFlag='Y';
                    }
                });
                if(planCnt ==0){
                    alert("您尚未勾選任何險種!!!");
                }else if(amtFlag =='N'){
                    alert("您勾選的險種中尚有保額未選擇!!!");
                }else if(projFlag=='Y'){
                    alert('該險種組合重覆，請重新選擇險種!!!');
                }else{    
                    getGPAInputTR('N'+projKey);
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
            if(tmpKeyinClassType!=tmpClassType){
                getGPAKeyinProjList();
                tmpKeyinClassType=tmpClassType;
            }
            $('#keyinTbody tr').each(function(){
                $(this).find('[id=checkItem]').removeAttr("checked").removeAttr("disabled");
                $(this).find('[id=amtCD]').val('').removeAttr("disabled");
            });
            dispPlanItem('M');
        },
        close: function() {
            dispPlanItem('M');
        }
    });
}

function validateSubmit() {
    disabledBtn();
    cleanTips();
    var valid = true;
    var $agntCD = $("#agntCD"),
    $issueBrhCD = $("#issueBrhCD"),
    $from = $( "#from" ),
    $tm = $( "#tm" ),
    $to = $( "#to" ),
    $custNm = $( "#custNm" ),
    $custID = $( "#custID" ),
    $custZipCD = $( "#custZipCD" ),
    $custAdrs = $( "#custAdrs" ),
    $custTelOAreaCD = $( "#custTelOAreaCD" ),
    $custTelONo = $( "#custTelONo" ),
    $custTelOExt = $( "#custTelOExt" ),
    $buskindCD = $( "#buskindCD" ),
    $clmRecDesc = $( "#clmRecDesc" ),   
    $requiredFields = $([]).add($agntCD).add($issueBrhCD).add($from).add($tm).add($to).add($custNm).add($custID).add($custZipCD).add($buskindCD),
    $numberFields = $([]).add($custZipCD).add($custTelOAreaCD).add($custTelONo).add($custTelOExt);

    $agntCD.data("name", '經手人代號');
    $issueBrhCD.data("name", '出單單位');
    $from.data("name", '保險期間 起');
    $tm.data("name", '保險期間 時');
    $to.data("name", '保險期間 迄');
    $custNm.data("name", '要保單位 名稱');
    $custID.data("name", '要保單位 統一編號');
    $custZipCD.data("name", '要保單位 郵遞區號');
    $custAdrs.data("name", '要保單位 聯絡地址');
    $custTelOAreaCD.data("name", '要保單位 聯絡電話 區碼');
    $custTelONo.data("name", '要保單位 聯絡電話');
    $custTelOExt.data("name", '要保單位 聯絡電話 分機');
    $buskindCD.data("name", '經營業務種類');
    $clmRecDesc.data("name", '損失原因及損失說明');

    //檢查必填欄位
    $requiredFields.each(function(){
        valid = validateRequired($(this)) && valid;
    });

    //檢查數值欄位
    if(valid){
        $numberFields.each(function(){
            valid = validateNumber($(this)) && valid;
        });
    }       

    //檢查損失說明
    if($('#clmRecMKY').is(':checked')){
        valid = validateRequired($clmRecDesc) && valid;
    }

    //檢查是否有選擇方案
    valid = validateRequiredTR($('#projTbody tr'), '方案內容') && valid;

    //檢查ID
    if(valid){
        valid = checkLic($custID.val());
        if(!valid){
            updateTips(w_msg);
        }
    }
    
    //檢查保期
    if(valid){
        //現在時間
        var now = new Date();
        //檢查時間 0~23
        valid = valid && validateHour($tm);
        //檢查日期格式欄位
        if(valid){
            valid = validateDate($from) && valid;
            valid = validateDate($to) && valid;
        }
        //檢查日期起值不得為現在之前
        if(valid){
            var fromDate = new Date($from.val());
            fromDate.setHours(parseInt(24));
            valid = validateDateInterval(now, fromDate, uNow, $from.data("name"));
        }
        //檢查日期起值不得大於迄值
        valid = valid && validateDateInterval(new Date($from.val()), new Date($to.val()), $from.data("name"), $to.data("name"));
    }

    //檢查電話區碼與市話必須同時輸入
    if(valid){
        if($.trim($custTelONo.val()).length > 0){
            valid =  validateRequired($custTelOAreaCD) && valid;
        }
    }

    if(valid){
        composeProjDataJSON();
        $('#projTbodyHTML').val($('#projTbody').html());
        $('#agntCD').removeAttr('disabled');
        $('#issueBrhCD').removeAttr('disabled');
        $('#tm').removeAttr('readonly');
        $('#tm1').removeAttr('readonly');

        var urlx =  contextPath + '/action/getGPANewDataIDVerNo';
        $.ajax({url: urlx,
                type: 'POST',
                dataType: 'json',
                data: {'dataID': $('#inputDataId').val(),
                       'dataIDVerNo':($('#queryTyp').val()=='A' ? $('#inputDataIdVerNo').val() : '0')},
                async: false, // 使用同步查詢
                success: function (data) {
                     $('#inputDataId').val(data.dataIDVerNo);
                     $('#inputDataIdVerNo').val($('#queryTyp').val()=='A' ? $('#oriVerNo').val() : $('#inputDataIdVerNo').val());
                }
        });

    }
    enabledBtn();
    valid=true;//Prototype測試，先不檢核
    return valid;
}

function composeProjDataJSON() {
    var str;
    var projDataArr = new Array();
    $('#projTbody tr[level="1"]').each(function() {
        //fisher alert($.toJSON($(this).data()));
        str= '"jobType" : "' +$(this).data('jobType')
           + '","classType" : "' +$(this).data('classType')
           + '","underAge15" : "' +$(this).data('underAge15')
           + '","custCnt" : "' +$(this).data('custCnt')
           + '","projKey" : "' +$(this).data('projKey') + '"' ;
        projDataArr.push(str);
    });
    $('#projDataJSON').val(array2JSONString(projDataArr));
    $('#appGPAMBusKindCD').val($('#buskindCD').val());
}

function getGPAAgntCDList() {
    var url =  contextPath + '/action/getGPAAgntCDList';
    var msg = 'N';
    $.ajax({url: url,
            type: 'POST',
            dataType: 'json',
            data: {'reasonCD': $('#agntCD').val()},
            async: false, // 使用同步查詢
            success: function (data) {
                msg=data.msgHTML;
            }
    });
    return msg;
}

function getGPAIssueBrhCDList() {
    var url =  contextPath + '/action/getGPAIssueBrhCDList';
    var $issueBrhCD = $('#issueBrhCD');
    var $option = createOption('', '---請選擇---');
    $issueBrhCD.empty();
    $issueBrhCD.append($option);
    $.post(url, {
           'reasonCD': ''
      },
      function(data) {
         if(data != null){
             var issueBrhCDList = data.issueBrhCDList;
             $.each(issueBrhCDList, function(index, value){
                 $option = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                 $issueBrhCD.append($option);
             });
         }
    });
}

function getGPAInputTR(projKey) {
    var url =  contextPath + '/action/getGPAInputTR';
    var $projTbody = $('#projTbody');
    var tmpValue='';
    var tmpPlanNm='';
    var tdProjNm='';
    var tdClassType='';
    var tdCustCnt='';
    var tdPlanNm='';
    var tdPayNm='';
    var tdInsAmt='';
    //var tmpStr='';
    var $TR = $('<tr level="1"></tr>');
    var $TR1 = $('<tr></tr>');
    var $TB = $('<table></table>');
    var $TD = $('<td class="tableData" colspan="3" width="67%"></td>');
    $.ajax({url: url,
            type: 'POST',
            dataType: 'json',
            data: {'reasonCD':  ($('#checkUnderAge15').is(':checked')?'Y':'N') + projKey},
            async: false, // 使用同步查詢
            success: function (data) {
                if(data != null){
                    var projCDList = data.projHtmlTRList;
                    $.each(projCDList, function(index, value){
                        if(tmpValue != value){
                            if(index==0){
                                $TR.data("jobType",$('#jobCD2').val().substr(1,10));
                                $TR.data("classType",tmpClassType);
                                $TR.data("underAge15",($('#checkUnderAge15').is(':checked')?'Y':'N'));
                                $TR.data("custCnt",$('#custCnt').val());
                                $TR.data("projKey",projKey.substring(1,300));
                                tdProjNm=$.trim(value.split('||')[0]);
                                tdClassType=$("#jobCD2").data($("#jobCD2").val())+' - 第'+tmpClassType+'類';
                                tdCustCnt=$('#custCnt').val() + '人'+($('#checkUnderAge15').is(':checked')?'(15足歲以下)':'');
                                tdPlanNm=$.trim(value.split('||')[1]);
                                tdPayNm=$.trim(value.split('||')[2]);
                                tdInsAmt=$.trim(value.split('||')[3]);
                            }else if($.trim(value.split('||')[1]) != tmpPlanNm){
                                $TR1.append('<td>'+tdPlanNm+'</td>');
                                $TR1.append('<td>'+tdPayNm+'</td>');
                                $TR1.append('<td>'+tdInsAmt+'</td>');
                                $TB.append($TR1);
                                $TR1 = $('<tr></tr>');
                                tdPlanNm=$.trim(value.split('||')[1]);
                                tdPayNm=$.trim(value.split('||')[2]);
                                tdInsAmt=$.trim(value.split('||')[3]);
                            }else{
                                tdProjNm=tdProjNm +'<br>';
                                tdClassType=tdClassType +'<br>';
                                tdCustCnt=tdCustCnt +'<br>';
                                tdPlanNm=tdPlanNm +'<br>' + ($.trim(value.split('||')[1])==tmpPlanNm ? '' : $.trim(value.split('||')[1]));
                                tdPayNm=tdPayNm +'<br>' + $.trim(value.split('||')[2]);
                                tdInsAmt=tdInsAmt +'<br>' + $.trim(value.split('||')[3]);
                            }
                            tmpValue = value;
                            tmpPlanNm=$.trim(value.split('||')[1]);
                        }
                    });
                    $TR.append('<td class="tableData" width="3%">'+$deleter+'</td>');
                    $TR.append('<td class="tableData" width="10%">'+tdProjNm+'</td>');
                    $TR.append('<td class="tableData" width="10%">'+tdClassType+'</td>');
                    $TR.append('<td class="tableData" width="10%">'+tdCustCnt+'</td>');
                    $TR1.append('<td class="tableData noBackround" width="20%">'+tdPlanNm+'</td>');
                    $TR1.append('<td class="tableData noBackround" width="32%">'+tdPayNm+'</td>');
                    $TR1.append('<td class="tableData noBackround" width="15%">'+tdInsAmt+'</td>');
                    $TB.append($TR1);
                    $TD.append($TB);
                    $TR.append($TD);
                    $projTbody.append($TR);
                }
            }
    });
}

function getGPABuskindCDList() {
    var url =  contextPath + '/action/getGPABuskindCDList';
    var $buskindCD = $('#buskindCD');
    $buskindCD.empty();
    $.ajax({url: url,
            type: 'POST',
            dataType: 'json',
            data: {'reasonCD': 'Y1'},
            async: false, // 使用同步查詢
            success: function (data) {
                if(data != null){
                    var buskindCDList = data.buskindCdList;
                    $.each(buskindCDList, function(index, value){
                        if(index==0){
                            var $option = createOption('', '---請選擇---');
                            $buskindCD.append($option);
                        }
                        $option = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                        $buskindCD.append($option);
                    });
                }
            }
    });
}

function getGPAJobCDList() {
    var url =  contextPath + '/action/getGPAJobCDList';
    var $jobCD1 = $('#jobCD1');
    var $jobCD2 = $('#jobCD2');
    $jobCD1.empty();
    $jobCD2.empty();
    $.ajax({url: url,
            type: 'POST',
            dataType: 'json',
            data: {'reasonCD': 'Y1'},
            async: false, // 使用同步查詢
            success: function (data) {
                if(data != null){
                    var jobCDList = data.jobCdList;
                    $.each(jobCDList, function(index, value){
                        if(index==0){
                            var $option1 = createOption('', '---請選擇---');
                            var $option2 = createOption('', '---請選擇---');
                            $jobCD1.append($option1);
                            $jobCD2.append($option2);
                        }
                        if($.trim(value.split('||')[0])=='1'){
                            $option1 = createOption($.trim(value.split('||')[1]), $.trim(value.split('||')[2]));
                            $jobCD1.append($option1);
                        }else{
                            $option2 = createOption($.trim(value.split('||')[1]), $.trim(value.split('||')[2]));
                            $jobCD2.append($option2);
                            $jobCD2.data($.trim(value.split('||')[1]), $.trim(value.split('||')[2]));
                        }
                    });
                }
            }
    });
}

function getGPASuitProjList() {
    var url =  contextPath + '/action/getGPASuitProjList';
    var $projCD = $('#projCD');
    $projCD.empty();
    $.ajax({url: url,
            type: 'POST',
            dataType: 'json',
            data: {'reasonCD': 'Y' + tmpClassType + ($('#checkUnderAge15').is(':checked')?'Y':'N')},
            async: false, // 使用同步查詢
            success: function (data) {
                if(data != null){
                    var projCDList = data.projHtmlTRList;
                    $.each(projCDList, function(index, value){
                        if(index==0){
                            var $option = createOption('', '---請選擇---');
                            $projCD.append($option);
                        }
                        $option = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                        $projCD.append($option);
                    });
                }
            }
    });
}

function getGPAKeyinProjList() {
    var url =  contextPath + '/action/getGPASuitProjList';
    var $keyinTbody = $('#keyinTbody');
    $keyinTbody.empty();
    var tmpPlanCD='';
    var tmpPayNm='';
    var tmpAmtCD='';
    var tmpAmtNm='';
    var $TR='';
    var $TR1='';
    $.ajax({url: url,
            type: 'POST',
            dataType: 'json',
            data: {'reasonCD': 'N' + tmpClassType + ($('#checkUnderAge15').is(':checked')?'Y':'N')},
            async: false, // 使用同步查詢
            success: function (data) {
                if(data != null){
                    var planList = data.projHtmlTRList;
                    $.each(planList, function(index, value){
                        var itemList = value.split('||');
                        if(tmpPlanCD != itemList[0]){
                            if(tmpPlanCD !=''){
                                $TR.append('<td class="tableData"><select id="amtCD" class="tbselect"><option value="">---請選擇---</option>'+tmpAmtCD+'</select></td>');
                                $keyinTbody.append($TR);
                                $TR1.append('<td class="tableData"><FONT color="#0000ff">'+tmpPayNm+'</FONT></td>');
                                $TR1.append('<td class="tableData"><FONT color="#0000ff">'+tmpAmtNm+'</FONT></td>');
                                $keyinTbody.append($TR1);
                            }
                            $TR = $('<tr planCD="'+itemList[0]+'" grpNum="'+itemList[6]+'"></tr>');
                            $TR.append('<td class="tableData"><input type="checkbox" id="checkItem"/></td>');
                            $TR.append('<td class="tableData">'+itemList[1]+'</td>');
                            $TR.append('<td class="tableData"><a href="javascript:dispPayItem(\''+itemList[0]+'\')">明細範例</a></td>');
                            $TR.data("planCD",itemList[0]);
                            $TR.data("dispType",itemList[5]);
                            $TR.find(":checkbox").bind('change', function() {
                                var $table = $(this).closest("table");
                                if(this.checked) {
                                    $table.find("tr[grpNum='"+itemList[6]+"'][grpNum!='0'][planCD!='"+itemList[0]+"']").each(function(){
                                        $(this).find('[id=checkItem]').attr("disabled",true);
                                        $(this).find('[id=amtCD]').val('');
                                        $(this).find('[id=amtCD]').attr("disabled",true);
                                    });
                                } else {
                                    $table.find("tr[grpNum='"+itemList[6]+"'][grpNum!='0'][planCD!='"+itemList[0]+"']").each(function(){
                                        $(this).find('[id=checkItem]').attr("disabled",false);
                                        $(this).find('[id=amtCD]').attr("disabled",false);
                                    });
                                }  
                            });
                            $TR1 = $('<tr></tr>');
                            $TR1.append('<td class="tableData"></td>');
                            $TR1.append('<td class="tableData"></td>');
                            $TR1.data("planCD",itemList[0]);
                            $TR1.data("dispType","N");

                            tmpPlanCD = itemList[0];
                            tmpPayNm=itemList[2];
                            tmpAmtNm=itemList[4];
                            tmpAmtCD='<option value="'+itemList[3]+'">'+itemList[4]+'</option>';
                        }else{
                            if(itemList[5]=='N'){
                                tmpPayNm=tmpPayNm+'<br>'+itemList[2];
                                tmpAmtNm=tmpAmtNm+'<br>'+itemList[4];
                            }else{
                                tmpAmtCD=tmpAmtCD+'<option value="'+itemList[3]+'">'+itemList[4]+'</option>';
                            }
                        }
                    });
                    $TR.append('<td class="tableData"><select id="amtCD" class="tbselect"><option value="">---請選擇---</option>'+tmpAmtCD+'</select></td>');
                    $keyinTbody.append($TR);
                    $TR1.append('<td class="tableData"><FONT color="#0000ff">'+tmpPayNm+'</FONT></td>');
                    $TR1.append('<td class="tableData"><FONT color="#0000ff">'+tmpAmtNm+'</FONT></td>');
                    $keyinTbody.append($TR1);
                }
            }
    });
}

function dispPayItem(planCD) {
    $('#keyinTbody tr').each(function(){
        if($(this).data("planCD") == planCD && $(this).data("dispType") =='N'){
            $(this).toggle();
        }
    });
}

function dispPlanItem(dispType) {
    $('#keyinTbody tr').each(function(){
        if(dispType=='ALL' && $(this).data("dispType") =='N'){
            $(this).hide();
        }else if(dispType=='M' && $(this).data("dispType") !='M'){
            $(this).hide();
        }else{
            $(this).show();
        }
    });

    if(dispType=='ALL'){
        $('#allPlan').hide();
        $('#mPlan').show();
    }else{
        $('#allPlan').show();
        $('#mPlan').hide();
    }
}

function disabledBtn() {
    $('#actn_cancelEdit').attr('disabled', true);
    $("#actn_calc").attr('disabled', true);
    $("#newProjBtn").attr('disabled', true);
}

function enabledBtn() {
    $('#actn_cancelEdit').removeAttr('disabled');
    $("#actn_calc").removeAttr('disabled');
    $('#newProjBtn').removeAttr('disabled');
}

function edit(act_cd) {
    //none 輸入頁不需重整檢核項目
}

function getGTL2ProjNM() {
    var $ProjNM = $('#ProjNM');
    $ProjNM.empty();
    var ProjNMList=["","A001||個人責任保險基本型","A002||個人責任保險基本型1","A003||個人責任保險基本型2"]; //Prototype模擬JSON回傳,正式開發再採用AJAX
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


function getGTL2option() {
    var $optionResponsibility=$('#optionResponsibility');
    var $optionCancel=$('#optionCancel');

    
    var $Packagelost=$('#Packagelost');
    var $Packagedelay=$('#Packagedelay');
    var $Schedulechange=$('#Schedulechange');    
      
    $optionResponsibility.empty();
    $optionCancel.empty();

    $Packagelost.empty();
    $Packagedelay.empty();
    $Schedulechange.empty();   
    var CustAge15List=["","10||10","20||20","30||30","40||40"]; //Prototype模擬JSON回傳,正式開發再採用AJAX
                    $.each(CustAge15List, function(index, value){
                        if(index==0) {
                            var $option1_1 = createOption('', '10');
                            var $option1_2 = createOption('', '---請選擇---');  
                            var $option1_3 = createOption('', '---請選擇---'); 
                            
                            var $option2_1 = createOption('', '---請選擇---');
                            var $option2_2 = createOption('', '---請選擇---');  
                            var $option2_3 = createOption('', '---請選擇---'); 
                                                            
                            $optionResponsibility.append($option1_1);
                            $optionCancel.append($option1_2);

                            
                            $Packagelost.append($option2_1);
                            $Packagedelay.append($option2_2);
                            $Schedulechange.append($option2_3);
                          
                        }
                        else {
                            $option1_1 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option1_2 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option1_3 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));  
                            
                            $option2_1 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option2_2 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option2_3 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));                            
                            
                            $optionResponsibility.append($option1_1);
                            $optionCancel.append($option1_2);
 
                            
                            $Packagelost.append($option2_1);
                            $Packagedelay.append($option2_2);
                            $Schedulechange.append($option2_3);                            
                            

                        }
                    });    
    
}



function getGTL2CustAge15() {
    var $AGECustAge15ADD = $('#AGECustAge15ADD');
    var $AGECustAge15MR = $('#AGECustAge15MR');  
    var $AGECustAge15OS = $('#AGECustAge15OS');  

    var $AGECustAge15_80ADD= $('#AGECustAge15_80ADD');
    var $AGECustAge15_80MR= $('#AGECustAge15_80MR');
    var $AGECustAge15_80OS= $('#AGECustAge15_80OS');    
    
    var $AGECustAge80ADD= $('#AGECustAge80ADD');    
    var $AGECustAge80MR= $('#AGECustAge80MR');  
    var $AGECustAge80OS= $('#AGECustAge80OS');  

    $AGECustAge15ADD.empty();
    $AGECustAge15MR.empty();
    $AGECustAge15OS.empty();
    
    $AGECustAge15_80ADD.empty();
    $AGECustAge15_80MR.empty();
    $AGECustAge15_80OS.empty();    
    
    $AGECustAge80ADD.empty();
    $AGECustAge80MR.empty();
    $AGECustAge80OS.empty();    
    var CustAge15List=["","100||100","200||200","300||300","400||400"]; //Prototype模擬JSON回傳,正式開發再採用AJAX
   
                    $.each(CustAge15List, function(index, value){
                        if(index==0) {
                            var $option1_1 = createOption('', '---請選擇---');
                            var $option1_2 = createOption('', '---請選擇---');  
                            var $option1_3 = createOption('', '---請選擇---'); 
                            
                            var $option2_1 = createOption('', '---請選擇---');
                            var $option2_2 = createOption('', '---請選擇---');
                            var $option2_3 = createOption('', '---請選擇---'); 
                            
                            var $option3_1 = createOption('', '---請選擇---'); 
                            var $option3_2 = createOption('', '---請選擇---');  
                            var $option3_3 = createOption('', '---請選擇---');                                 
                            $AGECustAge15ADD.append($option1_1);
                            $AGECustAge15MR.append($option1_2);
                            $AGECustAge15OS.append($option1_3);
                            
                            $AGECustAge15_80ADD.append($option2_1);
                            $AGECustAge15_80MR.append($option2_2);
                            $AGECustAge15_80OS.append($option2_3);                            
                            
                            $AGECustAge80ADD.append($option3_1);
                            $AGECustAge80MR.append($option3_2);
                            $AGECustAge80OS.append($option3_3);                            
                        }
                        else {
                            $option1_1 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option1_2 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option1_3 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));

                            $option2_1 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option2_2 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $option2_3 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                           
                            $option3_1 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));  
                            $option3_2 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));                           
                            $option3_3 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));                           
                            
                            $AGECustAge15ADD.append($option1_1);
                            $AGECustAge15MR.append($option1_2);
                            $AGECustAge15OS.append($option1_3);
                            
                            $AGECustAge15_80ADD.append($option2_1);
                            $AGECustAge15_80MR.append($option2_2);
                            $AGECustAge15_80OS.append($option2_3);                            
                            
                            $AGECustAge80ADD.append($option3_1);
                            $AGECustAge80MR.append($option3_2);
                            $AGECustAge80OS.append($option3_3);  
                        }
                    });
    
}


function getGTL2TourAreaCD() {

    var url =  contextPath + '/action/getGTL2TourAreaCD';
    var $tourAreaCD = $('#tourAreaCD');

    $tourAreaCD.empty();

    $.ajax({url: url,
            type: 'POST',
            dataType: 'json',
            data: {'reasonCD': 'Y1'},
            async: false, // 使用同步查詢
            success: function (data) {
                if(data != null){
                    var tourAreaCDList1 = data.tourAreaCDList;
                    //alert(tourAreaCDList1.toString());
                    $.each(tourAreaCDList1, function(index, value){
                        if(index==0) {
                            var $option1 = createOption('', '---請選擇---');
                            $tourAreaCD.append($option1);
                        }
                        else {
                            $option1 = createOption($.trim(value.split('||')[0]), $.trim(value.split('||')[1]));
                            $tourAreaCD.append($option1);
                        }
                    });
                }
            }
    });
}