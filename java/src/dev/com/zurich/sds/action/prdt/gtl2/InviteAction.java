/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zurich.sds.action.prdt.gtl2;

import com.zurich.sds.exception.ActionException;
import com.zurich.sds.model.entity.GPAInsMEntity;
import com.zurich.sds.model.entity.AppGPAInvEntity;
import com.zurich.sds.model.entity.AppGPAMEntity;
import com.zurich.sds.model.entity.CustDetailEntity.CustRoleCD;
import com.zurich.sds.model.entity.ProcStatusDefEntity;
import com.zurich.sds.utils.DateUtils;
import com.zurich.sds.utils.pdf.GenPDFAgent;
import com.zurich.sds.utils.pdf.PDFVO;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

/**
 *
 * @author fisher.chiang
 */
public class InviteAction extends AbstractGTL2Action {

    private static final long serialVersionUID = -4494934604695553819L;
    private int dataIDVerNo;
    private int yearDiff;
    private int monthDiff;
    private int dayDiff;
    private String note;
    private String uploadDataId;
    private String inputDataId;
    private String inputDataIdVerNo;
    private String inqDataId;
    private String uploadFileNm;
    private String projDataJSON;
    private String projTbodyHTML;
    private String actionCD;
    private String roleLevel;
    private String formTyp;
    private String msgHTML;
    private String pdfTitle;
    private String incomeUsrNote;
    private String queryDataId;
    private String queryTyp;
    private String procStatusDesc;
    private String insExpTM;
    private InputStream inputStream;
    private FileInputStream fis;
    private FileOutputStream fos;
    private AppGPAInvEntity appGPAInv;
    private AppGPAMEntity appGPAM;
    private List<ProcStatusDefEntity> procStatusList;
    private String oriData;
    private String agntCDE;
    private String AGECustAge15cnt_h;
    private String AGECustAge15_80cnt_h;
    private String AGECustAge80cnt_h;
    private int AGESum;

    public int getAGESum() {
        return AGESum;
    }

    public void setAGESum(int AGESum) {
        this.AGESum = this.AGESum+AGESum;
    }
        

    public String getAGECustAge15_80cnt_h() {
        return AGECustAge15_80cnt_h;
    }

    public void setAGECustAge15_80cnt_h(String AGECustAge15_80cnt_h) {
        this.AGECustAge15_80cnt_h = AGECustAge15_80cnt_h;
    }

    public String getAGECustAge15cnt_h() {
        return AGECustAge15cnt_h;
    }

    public void setAGECustAge15cnt_h(String AGECustAge15cnt_h) {
        this.AGECustAge15cnt_h = AGECustAge15cnt_h;
    }
  
    
    public String getAGECustAge80cnt_h() {
        return AGECustAge80cnt_h;
    }

    public void setAGECustAge80cnt_h(String AGECustAge80cnt_h) {
        this.AGECustAge80cnt_h = AGECustAge80cnt_h;
    }
    
    

    public String getAgntCDE() {
        return agntCDE;
    }

    public void setAgntCDE(String agntCDE) {
        this.agntCDE = agntCDE;
    }
    
    

    public String getOriDataID() {
        return oriData;
    }

    public void setOriDataID(String oriDataID) {
        this.oriData = oriDataID;
    }

    public int getYearDiff() {
        return yearDiff;
    }

    public void setYearDiff(int yearDiff) {
        this.yearDiff = yearDiff;
    }

    public int getMonthDiff() {
        return monthDiff;
    }

    public void setMonthDiff(int monthDiff) {
        this.monthDiff = monthDiff;
    }

    public int getDayDiff() {
        return dayDiff;
    }

    public void setDayDiff(int dayDiff) {
        this.dayDiff = dayDiff;
    }

    public String getProcStatusDesc() {
        return procStatusDesc;
    }

    public void setProcStatusDesc(String procStatusDesc) {
        this.procStatusDesc = procStatusDesc;
    }

    public String getQueryTyp() {
        return queryTyp;
    }

    public void setQueryTyp(String queryTyp) {
        this.queryTyp = queryTyp;
    }

    public String getInputDataIdVerNo() {
        return inputDataIdVerNo;
    }

    public void setInputDataIdVerNo(String inputDataIdVerNo) {
        this.inputDataIdVerNo = inputDataIdVerNo;
    }
    
    public String getInsExpTM() {
        return insExpTM;
    }

    public void setInsExpTM(String insExpTM) {
        this.insExpTM = insExpTM;
    }

    public String getIncomeUsrNote() {
        return incomeUsrNote;
    }

    public void setIncomeUsrNote(String incomeUsrNote) {
        this.incomeUsrNote = incomeUsrNote;
    }

    public String getPdfTitle() {
        return pdfTitle;
    }

    public void setPdfTitle(String pdfTitle) {
        this.pdfTitle = pdfTitle;
    }

    public String getUploadFileNm() {
        return uploadFileNm;
    }

    public void setUploadFileNm(String uploadFileNm) {
        this.uploadFileNm = uploadFileNm;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public FileInputStream getFis() {
        return fis;
    }
    public void setFis(FileInputStream fis) {
        this.fis = fis;
    }

    public FileOutputStream getFos() {
        return fos;
    }

    public void setFos(FileOutputStream fos) {
        this.fos = fos;
    }

    public String getUploadDataId() {
        return uploadDataId;
    }

    public void setUploadDataId(String uploadDataId) {
        this.uploadDataId = uploadDataId;
    }
    
    public String getInputDataId() {
        return inputDataId;
    }

    public void setInputDataId(String inputDataId) {
        this.inputDataId = inputDataId;
    }

    public String getInqDataId() {
        return inqDataId;
    }

    public void setInqDataId(String inqDataId) {
        this.inqDataId = inqDataId;
    }

    public String getFormTyp() {
        return formTyp;
    }

    public void setFormTyp(String formTyp) {
        this.formTyp = formTyp;
    }

    public String getRoleLevel() {
        return roleLevel;
    }

    public void setRoleLevel(String roleLevel) {
        this.roleLevel = roleLevel;
    }

    public String getActionCD() {
        return actionCD;
    }

    public void setActionCD(String actionCD) {
        this.actionCD = actionCD;
    }

    public String getMsgHTML() {
        return msgHTML;
    }

    public void setMsgHTML(String msgHTML) {
        this.msgHTML = msgHTML;
    }

    public String getQueryDataId() {
        return queryDataId;
    }

    public void setQueryDataId(String queryDataId) {
        this.queryDataId = queryDataId;
    }

    public List<ProcStatusDefEntity> getProcStatusList() {
        return procStatusList;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getProjDataJSON() {
        return projDataJSON;
    }

    public void setProjDataJSON(String projDataJSON) {
        this.projDataJSON = projDataJSON;
    }

    public String getProjTbodyHTML() {
        return projTbodyHTML;
    }

    public void setProjTbodyHTML(String projTbodyHTML) {
        this.projTbodyHTML = projTbodyHTML;
    }

    public AppGPAInvEntity getAppGPAInv() {
        return appGPAInv;
    }

    public void setAppGPAInv(AppGPAInvEntity appGPAInv) {
        this.appGPAInv = appGPAInv;
    }

    public AppGPAMEntity getAppGPAM() {
        return appGPAM;
    }

    public void setAppGPAM(AppGPAMEntity appGPAM) {
        this.appGPAM = appGPAM;
    }

    public void prepareExecute() {
//        initAgntInfo();
//        initTourArea();
//        applicantRelDefs = gtlService.getRefDefList(RelDefEntity.TypeCD.A);
//        benefRelDefs = gtlService.getRefDefList(RelDefEntity.TypeCD.B);
    }

    @Override
    public String execute() throws ActionException {
        //log.debug(getAGECustAge15cnt_h());
        //log.debug(getAGECustAge15_80cnt_h());
        //log.debug(getAGECustAge80cnt_h());
        

        
        if("".equals(getAGECustAge15cnt_h())){
            //do nothing
        }else{
            //AGESum=AGESum+1;
            setAGESum(1);
        }

        if("".equals(getAGECustAge15_80cnt_h())){
            //do nothing
        }else{
            //AGESum=AGESum+1;
            setAGESum(1);
        }
        
        if("".equals(getAGECustAge80cnt_h())){
            //do nothing
        }else{
            //AGESum=AGESum+1;
            setAGESum(1);
        }        
        
        
        
        return INPUT;
    } 
    
    public String query() throws ActionException {
        //if(getLoginId()==null){
        //    return LOGIN;
        //}
        
        setUploadDataId(null);
        return SUCCESS;
    } 
    
    public String SendCPC() throws ActionException {
        log.debug("SendCPCSendCPC");
        return INPUT;
    }
    
    public String CPCFinish() throws ActionException {
        log.debug("CPCfinish");
        return SUCCESS;
    }
    
    
    public String saveData() throws ActionException {
        if(getLoginId()==null){
            //return LOGIN;
            getSession().put("strLog_ID","A123456789");
        }  
        String[] newData = StringUtils.split(getInputDataId(), "-");
        setDataId(newData[0]);
        dataIDVerNo=Integer.valueOf(newData[1]);
        //================變更要保資料================
        prdtGPAService.updateAppGPAInv(appGPAInv); 
        //================變更方案資料================
        JSONArray projDataArr = (JSONArray) JSONSerializer.toJSON(projDataJSON);
        List<GPAInsMEntity> GPAInsMList = new ArrayList();
        for (int i = 0; i < projDataArr.size(); i++) {
            JSONObject projData = (JSONObject) projDataArr.get(i);
            GPAInsMEntity GPAInsM = new GPAInsMEntity();
            GPAInsM.setDataID(getDataId());
            GPAInsM.setDataIDVerNo(dataIDVerNo);
            GPAInsM.setProjNum(NumberUtils.toInt((String) projData.get("projNum")));
            GPAInsM.setInvMK((String) projData.get("invMK"));
            GPAInsM.setInvCustCnt(NumberUtils.toInt((String) projData.get("invCustCnt")));
            GPAInsMList.add(GPAInsM);
        }
        prdtGPAService.updateGPAInsM(GPAInsMList);
        //================變更狀態並記錄================
        if("INV".equals(getActionCD())){
            appGPAM.setDataID(getDataId());
            appGPAM.setDataIDVerNo(dataIDVerNo);
            setMsgHTML(prdtGPAService.getExecGPAAction(appGPAM, getActionCD(), getLoginId()));
        }
        //================清除DataId================
        setDataId(null);
        //執行組合invData動作
        setInqDataId(getInputDataId());
        return chgPrm();
    }

    public String chgPrm() throws ActionException {
        /*if(getLoginId()==null){
            return LOGIN;
        }*/
        String[] inqData = StringUtils.split(getInqDataId(), "-");
        setDataId(inqData[0]);
        dataIDVerNo=Integer.valueOf(inqData[1]);
        if (appGPAM == null) {
            appGPAM = new AppGPAMEntity();
        }
        if (appGPAInv == null) {
            appGPAInv = new AppGPAInvEntity();
        }
        //判斷actionCD
        System.out.println("chgPrm==>"+getLoginId());
        String[] flowInfo = StringUtils.split(prdtGPAService.getGPAHtmlTR(getDataId(), dataIDVerNo,"07", getLoginId()), "||");
        setActionCD(flowInfo[0]);
        setRoleLevel(flowInfo[1]);
        //處理要保頁面-客戶資訊
        setCustD(commonService.getCustDetailTb(inqData[0]+(inqData[1].length()==1 ? "0":"")+inqData[1], CustRoleCD.A));
        //處理要保頁面-方案資訊
        projTbodyHTML = prdtGPAService.getGPAHtmlTR(getDataId(),dataIDVerNo,"20");
        //處理要保頁面-其他資訊
        List<String> resultInfo = prdtGPAService.getGPAHtmlTRList(getDataId(),dataIDVerNo,"06");
        getAppM().setAgntCD(resultInfo.get(0));
        getAppM().setIssueBrhCD(resultInfo.get(1));
        getAppM().setInsEffDtString(resultInfo.get(2));
        getAppM().setInsExpDtString(resultInfo.get(3));
        appGPAM.setTotPrm(Integer.valueOf(resultInfo.get(4)));
        appGPAM.setAdjTotPrm(Integer.valueOf(resultInfo.get(5)));
        appGPAM.setProcStatusCD(resultInfo.get(6));
        appGPAM.setInsEffTM(Integer.valueOf(resultInfo.get(7)));
        appGPAM.setInsExpTM(Integer.valueOf(resultInfo.get(8)));
        appGPAM.setIncomeUsrNote(resultInfo.get(9));
        appGPAM.setUWUsrNote(resultInfo.get(10));
        appGPAM.setReferralLvl(resultInfo.get(11));
        appGPAM.setBusKindCD(resultInfo.get(12));
        appGPAM.setClmRecMK(resultInfo.get(13));
        appGPAM.setClmRecDesc(resultInfo.get(14));
        appGPAM.setPayMode(Integer.valueOf(resultInfo.get(15)));
        appGPAM.setSuitMK(resultInfo.get(16));
        appGPAM.setRateType(resultInfo.get(17));
        appGPAM.setOrgMK(resultInfo.get(18));
        setProcStatusDesc(resultInfo.get(19));
        appGPAM.setDataID(getDataId());
        appGPAM.setDataIDVerNo(dataIDVerNo);
        setUploadDataId(null);
        //處理要保頁面-其他資訊
        resultInfo = prdtGPAService.getGPAHtmlTRList(getDataId(),dataIDVerNo,"19",getLoginId());
        appGPAInv.setDataID(getDataId());
        appGPAInv.setDataIDVerNo(dataIDVerNo);
        appGPAInv.setBusKindCD(resultInfo.get(0));
        appGPAInv.setInvNm(resultInfo.get(1));
        appGPAInv.setInvID(resultInfo.get(2));
        appGPAInv.setInvNmB(resultInfo.get(3));
        appGPAInv.setInvNmC(resultInfo.get(4));
        appGPAInv.setInvEMail(resultInfo.get(5));
        appGPAInv.setInvTelO(resultInfo.get(6));
        appGPAInv.setInvFax(resultInfo.get(7));
        appGPAInv.setInvZipCD(resultInfo.get(8));
        appGPAInv.setInvAdrs(resultInfo.get(9));
        appGPAInv.setInsEffDtString(resultInfo.get(10));
        appGPAInv.setInsExpDtString(resultInfo.get(11));
        appGPAInv.setInsEffTM(Integer.valueOf(resultInfo.get(12)));
        appGPAInv.setInsExpTM(Integer.valueOf(resultInfo.get(13)));
        appGPAInv.setPayType(Integer.valueOf(resultInfo.get(14)));
        appGPAInv.setPayChl(Integer.valueOf(resultInfo.get(15)));
        appGPAInv.setPayMode(Integer.valueOf(resultInfo.get(16)));
        appGPAInv.setInsDtlType(Integer.valueOf(resultInfo.get(17)));
        appGPAInv.setRcptNm(resultInfo.get(18));
        appGPAInv.setRcptZipCD(resultInfo.get(19));
        appGPAInv.setRcptAdrs(resultInfo.get(20));
        appGPAInv.setRcptMemo(resultInfo.get(21));
        appGPAInv.setAgntMemo(resultInfo.get(22));
        appGPAInv.setPolCopyNum(Integer.valueOf(resultInfo.get(23)));
        appGPAInv.setRcptCopyNum(Integer.valueOf(resultInfo.get(24)));
        appGPAInv.setLCardMK(resultInfo.get(25));
        appGPAInv.setSCardMK(resultInfo.get(26));
        setYearDiff(Integer.valueOf(resultInfo.get(27)));
        setMonthDiff(Integer.valueOf(resultInfo.get(28)));
        setDayDiff(Integer.valueOf(resultInfo.get(29)));
        setYearDiff(getMonthDiff()>=getYearDiff()*12 ? getYearDiff() : getYearDiff()-1);
        setMonthDiff(getMonthDiff()-getYearDiff()*12);
        //清除dataId
        setDataId(null);
        
        return SUCCESS;
    }
    
    
    public String SumitIns() throws ActionException {
        
        return SUCCESS;
    }
    
    
    public String Payment() throws ActionException {
        
        return SUCCESS;
    }            
            
    public String showPDF() throws ActionException {
        //if(getLoginId()==null){
        //    return LOGIN;
        //}
        ArrayList detail = (ArrayList) prdtGPAService.getGPAHtmlTRList(appGPAM.getDataID(), appGPAM.getDataIDVerNo(), "12", getFormTyp() + getPdfTitle());
        ArrayList fontInfo = (ArrayList) prdtGPAService.getGPAHtmlTRList(appGPAM.getDataID(), appGPAM.getDataIDVerNo(), "11", getFormTyp());
        //執行trTyp"10"之前必須先執行trTyp"12"
        ArrayList formInfo = (ArrayList) prdtGPAService.getGPAHtmlTRList(appGPAM.getDataID(), appGPAM.getDataIDVerNo(), "10", getFormTyp());
        if(detail != null){
            try {
                PDFVO valueVO = new PDFVO();
                GenPDFAgent genPDFAgnt = new GenPDFAgent();
                ByteArrayOutputStream out = null;
                String[] str = null;
                int i =0 ;
                //組合資料
                for (i = 0; i < formInfo.size(); i++) {
                    str = StringUtils.split((String)formInfo.get(i), "||");
                    valueVO.addForm(str[0], str[1]);
                }
                for (i = 0; i < fontInfo.size(); i++) {
                    str = StringUtils.split((String)fontInfo.get(i), "||");
                    valueVO.addSpecialType(str[0], str[1],
                                           NumberUtils.toInt(str[2]),
                                           NumberUtils.toInt(str[3]),
                                           NumberUtils.toInt(str[4]),
                                           str[5], str[6],
                                           str[7], str[8],
                                           NumberUtils.toInt(str[9]),
                                           NumberUtils.toFloat(str[10]),
                                           NumberUtils.toFloat(str[11]),
                                           NumberUtils.toFloat(str[12]));
                }
                for (i = 0; i < detail.size(); i++) {
                    str = StringUtils.split((String)detail.get(i), "||");
                    valueVO.addDetail(str[0], str[1],
                                      NumberUtils.toFloat(str[2]),
                                      NumberUtils.toFloat(str[3]));
                }
                //執行
                setUploadFileNm(appGPAM.getDataID()+(appGPAM.getDataIDVerNo()<10?"0"+appGPAM.getDataIDVerNo():appGPAM.getDataIDVerNo())+".pdf");
                out = genPDFAgnt.performUpdate(valueVO);
                inputStream = new ByteArrayInputStream(out.toByteArray());
                 
            } catch (Throwable t) {
                log.error("Gen PDF failed, caused by: {}.", t.getMessage());
            }
        }

        if("PRI".equals(getActionCD())){
            setMsgHTML(prdtGPAService.getExecGPAAction(appGPAM, getActionCD(), getLoginId()));
        }
        
	return SUCCESS;
    }

}
