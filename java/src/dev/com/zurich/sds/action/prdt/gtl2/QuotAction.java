/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zurich.sds.action.prdt.gtl2;

import com.zurich.sds.exception.ActionException;
import com.zurich.sds.model.entity.GPAInsMEntity;
import com.zurich.sds.model.entity.AppGPAMEntity;
import com.zurich.sds.model.entity.CalcGPAPrmEntity;
import com.zurich.sds.model.entity.CustDetailEntity.CustRoleCD;
import com.zurich.sds.model.entity.ProcStatusDefEntity;
import com.zurich.sds.model.entity.QryAppGPAIncomeDtEntity;
import com.zurich.sds.model.param.QryAppGPAIncomeDtParam;
import com.zurich.sds.utils.DateUtils;
import com.zurich.sds.utils.notes.NotesSender;
import com.zurich.sds.utils.pdf.GenPDFAgent;
import com.zurich.sds.utils.pdf.PDFVO;
import com.zurich.sds.utils.webservice.IZGPAENQ.service.IZGPAENQ_AS400Service;
import com.zurich.sds.utils.webservice.IZGPAENR.service.IZGPAENR_AS400Service;
import java.io.*;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author fisher.chiang
 */
public class QuotAction extends AbstractGTL2Action {

    private static final long serialVersionUID = -4595953604694443819L;
    private int dataIDVerNo;
    private String note;
    private String newDataID;
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
    private String pllBusKindRefMapJSON;
    private AppGPAMEntity appGPAM;
    private File attachFile;
    
    private String attachFileFileName;
    private QryAppGPAIncomeDtParam qryAppGPAIncomeDtParam;
    private List<QryAppGPAIncomeDtEntity> qryAppGPAIncomeDtList;
    private List<ProcStatusDefEntity> procStatusList;
    
    private String AGECustAge15cnt_h;
    private String AGECustAge15_80cnt_h;
    private String AGECustAge80cnt_h;
    private String emgSearch;

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


    
    public String getEmgSearch() {
        return emgSearch;
    }

    public void setEmgSearch(String emgSearch) {
        this.emgSearch = emgSearch;
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
    
    public String getNewDataID() {
        return newDataID;
    }

    public void setNewDataID(String newDataID) {
        this.newDataID = newDataID;
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

    public String getPllBusKindRefMapJSON() {
        return pllBusKindRefMapJSON;
    }

    public AppGPAMEntity getAppGPAM() {
        return appGPAM;
    }

    public void setAppGPAM(AppGPAMEntity appGPAM) {
        this.appGPAM = appGPAM;
    }

    public File getAttachFile() {
        return attachFile;
    }

    public void setAttachFile(File attachFile) {
        this.attachFile = attachFile;
    }

    public String getAttachFileFileName() {
        return attachFileFileName;
    }

    public void setAttachFileFileName(String attachFileFileName) {
        this.attachFileFileName = attachFileFileName;
    }

    public QryAppGPAIncomeDtParam getQryAppIncomeDtParam() {
        return qryAppGPAIncomeDtParam;
    }

    public void setQryAppIncomeDtParam(QryAppGPAIncomeDtParam qryAppGPAIncomeDtParam) {
        this.qryAppGPAIncomeDtParam = qryAppGPAIncomeDtParam;
    }

    public List<QryAppGPAIncomeDtEntity> getQryAppGPAIncomeDtList() {
        return qryAppGPAIncomeDtList;
    }

    public void setQryAppIncomeDtList(List<QryAppGPAIncomeDtEntity> qryAppIncomeDtList) {
        this.qryAppGPAIncomeDtList = qryAppIncomeDtList;
    }

    @Override
    public void prepare() {
    }

    public void prepareExecute() {
        //pllBusKindRefMapJSON = JSONSerializer.toJSON(prdtGPAService.getPLLBusKindRef()).toString();
        procStatusList = prdtGPAService.getProcStatusDef("G");
        System.out.println(queryTyp+'-'+queryDataId+'-'+actionCD);
        if (appGPAM == null) {
            appGPAM = new AppGPAMEntity();
            appGPAM.setBusKindCD("");
            appGPAM.setClmRecMK("N");
            appGPAM.setSuitMK("Y");
            appGPAM.setRateType("I");
            appGPAM.setOrgMK("N");
            appGPAM.setPayMode(1);
        }
    }

    @Override
    public String execute() throws ActionException {
        /*if(getLoginId()==null){
            return LOGIN;
        }*/
        //clean tmpUploadFile
        
        
        File delFile = null;
        String dir = projectProp.getStringProperty("appMDocu.dir");
        String str = prdtGPAService.getExecGPAAction(new AppGPAMEntity(),"UPT", getLoginId());
         //System.out.println("Hao Start execute!!!3"+str);
        if(str != null && str.length()>2){
            String[] uploadFileStr = StringUtils.split(str.substring(2),"||");
            for (int i = 0; i < uploadFileStr.length; i++) {
                delFile = new File(dir + uploadFileStr[i]);
                System.out.println("delete " + dir + uploadFileStr[i] + " : " + delFile.delete());
            }
        }
        setUploadDataId(null);
        return INPUT;
    }

    public String calculate() throws ActionException {
        
        log.debug("Hao GOGOGOG");
        log.debug("Hao Start execute log15!!!"+getAGECustAge15cnt_h());
        log.debug("Hao Start execute log1580!!!"+getAGECustAge15_80cnt_h());
        log.debug("Hao Start execute log80!!!"+getAGECustAge80cnt_h());
        
//        if(getLoginId()==null){
//            //return LOGIN;
//            getSession().put("strLog_ID","A123456789");
//        }  
//        String[] newData = StringUtils.split(getInputDataId(), "-");
//        setDataId(newData[0]);
//        dataIDVerNo=Integer.valueOf(newData[1]);
//        //執行新增動作,已存在則略過
//        if(! "Y".equals(prdtGPAService.getGPAHtmlTR(getDataId(),dataIDVerNo,"08"))){
//            //重組資料並存檔計價
//            decomposeProjDataArr();
//            //更新上傳檔案的DataId
//            appGPAM.setReasonDesc(this.getUploadDataId());
//            setMsgHTML(prdtGPAService.getExecGPAAction(appGPAM, "UPL", getLoginId()));
//            appGPAM.setReasonDesc("");
//        }
//        setDataId(null);
//        
//        //執行組合reslut動作
//        setInqDataId(getInputDataId());
        return chgPrm();
    }

    public String chgPrm() throws ActionException {
        /*if(getLoginId()==null){
            return LOGIN;
        }*/
//        String[] inqData = StringUtils.split(getInqDataId(), "-");
//        setDataId(inqData[0]);
//        dataIDVerNo=Integer.valueOf(inqData[1]);
//        if (appGPAM == null) {
//            appGPAM = new AppGPAMEntity();
//        }
//        //判斷actionCD
//        System.out.println("chgPrm==>"+getLoginId());
//        String[] flowInfo = StringUtils.split(prdtGPAService.getGPAHtmlTR(getDataId(), dataIDVerNo,"07", getLoginId()), "||");
//        setActionCD(flowInfo[0]);
//        setRoleLevel(flowInfo[1]);
//        //處理結果頁面-客戶資訊
//        setCustD(commonService.getCustDetailTb(inqData[0]+(inqData[1].length()==1 ? "0":"")+inqData[1], CustRoleCD.A));
//        //處理結果頁面-方案資訊
//        projTbodyHTML = prdtGPAService.getGPAHtmlTR(getDataId(),dataIDVerNo,"03");
//        //處理結果頁面-其他資訊
//        List<String> resultInfo = prdtGPAService.getGPAHtmlTRList(getDataId(),dataIDVerNo,"06");
//        getAppM().setAgntCD(resultInfo.get(0));
//        getAppM().setIssueBrhCD(resultInfo.get(1));
//        getAppM().setInsEffDtString(resultInfo.get(2));
//        getAppM().setInsExpDtString(resultInfo.get(3));
//        appGPAM.setTotPrm(Integer.valueOf(resultInfo.get(4)));
//        appGPAM.setAdjTotPrm(Integer.valueOf(resultInfo.get(5)));
//        appGPAM.setProcStatusCD(resultInfo.get(6).replace("-", ""));
//        appGPAM.setInsEffTM(Integer.valueOf(resultInfo.get(7)));
//        appGPAM.setInsExpTM(Integer.valueOf(resultInfo.get(8)));
//        appGPAM.setIncomeUsrNote(resultInfo.get(9).replace("-", ""));
//        appGPAM.setUWUsrNote(resultInfo.get(10).replace("-", ""));
//        appGPAM.setReferralLvl(resultInfo.get(11));
//        appGPAM.setBusKindCD(resultInfo.get(12).replace("-", ""));
//        appGPAM.setClmRecMK(resultInfo.get(13).replace("-", ""));
//        appGPAM.setClmRecDesc(resultInfo.get(14).replace("-", ""));
//        appGPAM.setPayMode(Integer.valueOf(resultInfo.get(15)));
//        appGPAM.setSuitMK(resultInfo.get(16).replace("-", ""));
//        appGPAM.setRateType(resultInfo.get(17).replace("-", ""));
//        appGPAM.setOrgMK(resultInfo.get(18).replace("-", ""));
//        setProcStatusDesc(resultInfo.get(19).replace("-", ""));
//        appGPAM.setDataID(getDataId());
//        appGPAM.setDataIDVerNo(dataIDVerNo);
//        setUploadDataId(null);
//        //清除dataId
//        setDataId(null);
        
        return SUCCESS;
    }
    
    
    public String foreEmg() throws ActionException{
            
            // 海外急難救助資料
            setEmgSearch("200");
            log.debug("Hao emgSearch");
            log.debug(getEmgSearch());
        return SUCCESS;
    }
    

    public String edit() throws ActionException {
        //if(getLoginId()==null){
        //    return LOGIN;
        //}
        if(getActionCD().equals("CFM") || getActionCD().equals("R01") || getActionCD().equals("R02") || getActionCD().equals("UWB") || getActionCD().equals("UWS")){
            setMsgHTML(mail((ArrayList)prdtGPAService.getExecGPAActionList(appGPAM, getActionCD(), getLoginId())));
        }else{
            setMsgHTML(prdtGPAService.getExecGPAAction(appGPAM, getActionCD(), getLoginId()));
        }
        
        return SUCCESS;
    }
    
    public String showUploadFile() throws ActionException {
        String dir = projectProp.getStringProperty("appMDocu.dir");
        try {
            //讀檔
            setFis(new FileInputStream(dir+ uploadFileNm));
        } catch (Throwable t) {
            log.error("Show UploadFile failed, caused by: {}.", t.getMessage());
        }
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
                /*
                //寫檔
                this.setFos(new FileOutputStream("D:/"+appPLLM.getDataID()+(appPLLM.getDataIDVerNo()<10?"0"+appPLLM.getDataIDVerNo():appPLLM.getDataIDVerNo())+".pdf"));
                getFos().write(out.toByteArray());
                getFos().close();
                */
                 
            } catch (Throwable t) {
                log.error("Gen PDF failed, caused by: {}.", t.getMessage());
            }
        }

        if("PRT".equals(getActionCD())){
            edit();
        }
	return SUCCESS;
    }
    
    public String mail(ArrayList rsltMsg) throws ActionException {

        if(rsltMsg != null && rsltMsg.size() > 1 && ((String)rsltMsg.get(0)).substring(0,1).equals("0")){
            String url = StringUtils.substringBefore(ServletActionContext.getRequest().getRequestURL().toString(), ServletActionContext.getRequest().getServletPath());
            List<String> attachments = new ArrayList();
            //attachments.add(props.getStringProperty("pdf.dir") + this.getAppM().getDataID() + "\\" + this.getAppM().getDataID() + ".pdf");
            List<String> recipients = new ArrayList();
            //recipients.add("SDS.TWZ@zurich.com");
            recipients.add((String)(rsltMsg.get(1)));
            String subject = (String)(rsltMsg.get(2));
            String content = "";
            for(int i=3 ; i < rsltMsg.size() ; i++){
                content+=(String)(rsltMsg.get(i))+"<br>";
            }
            content+="本郵件由系統自動發送，若須查閱詳細資料請連結至 <a href=\"" + url + "\">網站</a> 登入後使用";
            NotesSender sender = NotesSender.getInstance();
            boolean rtCd = sender.send(subject, content, attachments, sender.MIMETYPE_TEXT_HTML, recipients);
        }
        return (String)rsltMsg.get(0);
    }

    public String query() throws ActionException {
        //if(getLoginId()==null){
        //    return LOGIN;
        //}
        qryAppGPAIncomeDtParam.setPrdtCD(QryAppGPAIncomeDtParam.PrdtCD.GPA);
        qryAppGPAIncomeDtParam.setUsrAcnt(getLoginId());
        qryAppGPAIncomeDtList = prdtGPAService.getQryAppGPAIncomeDt(qryAppGPAIncomeDtParam);
        setUploadDataId(null);
        return SUCCESS;
    }

    private int persistCust() {
        String custCnty = "Y".equals(getCustD().getForeignerMK()) ? "FOR" : "TWN";
        getCustD().setCustCnty(custCnty);
        return commonService.persistCust(getCustD());
    }

    private void decomposeProjDataArr() {
        //方案內容
        JSONArray projDataArr = (JSONArray) JSONSerializer.toJSON(projDataJSON);
        List<GPAInsMEntity> GPAInsMList = new ArrayList();
        for (int i = 0; i < projDataArr.size(); i++) {
            JSONObject projData = (JSONObject) projDataArr.get(i);
            String jobType = (String) projData.get("jobType");
            int classType = NumberUtils.toInt((String) projData.get("classType"));
            String underAge15 = (String) projData.get("underAge15");
            int custCnt = NumberUtils.toInt((String) projData.get("custCnt"));
            String projKey = (String) projData.get("projKey");
            int totProjPrm = 0;

            GPAInsMEntity GPAInsM = new GPAInsMEntity();
            GPAInsM.setDataID(getDataId());
            GPAInsM.setDataIDVerNo(dataIDVerNo);
            GPAInsM.setProjNum(i);
            GPAInsM.setJobType(jobType);
            GPAInsM.setClassType(classType);
            GPAInsM.setUnderAge15(underAge15);
            GPAInsM.setCustCnt(custCnt);
            GPAInsM.setProjKey(projKey);
            GPAInsM.setOriKey(projKey);
            GPAInsM.setTotProjPrm(totProjPrm);
            GPAInsMList.add(GPAInsM);
        }

        //存檔  
        //================新增一筆SDS進件記錄================
        if(dataIDVerNo == 1 && !"A".equals(getQueryTyp())){
            getAppM().setDataID(getDataId());
            getAppM().setIncomeID(getLoginId());
            commonService.persistAppM(getAppM());
        }
        //================新增保戶記錄================
        if(dataIDVerNo < 10){
            getCustD().setDataID(getDataId()+"0"+dataIDVerNo);
        } else {
            getCustD().setDataID(getDataId()+""+dataIDVerNo);
        }
        int custNo = persistCust();
        //================新增一筆GPA進件記錄================persistAppPLLM(custNo, totPrm, valid);
        if (appGPAM == null) {
            System.out.println(appGPAM.getRateType());
            appGPAM = new AppGPAMEntity();
        }
        appGPAM.setDataID(getDataId());
        appGPAM.setDataIDVerNo(dataIDVerNo);
        appGPAM.setInsuredCustNo(custNo);
        appGPAM.setInsEffDt(DateUtils.toSQLTimestamp(getAppM().getInsEffDt()));
        appGPAM.setInsExpDt(DateUtils.toSQLTimestamp(getAppM().getInsExpDt()));
        appGPAM.setInsEffTM(NumberUtils.toInt(getAppM().getInsEffTM()));
        appGPAM.setInsExpTM(NumberUtils.toInt(getInsExpTM()));
        appGPAM.setIncomeUsrNote(getIncomeUsrNote());
        appGPAM.setCreateID(getLoginId());
        appGPAM.setOriVerNo(NumberUtils.toInt(getInputDataIdVerNo()));

        //2013/5/10 Add by Steven 
        //新增[出單記錄]、[新單佣金率]、[續保佣金率]欄位 => 由 MSP 電文取得
        HashMap resultMap = null;
        String agentCD = getAppM().getAgntCD().trim();

        //IZGPAENQ：出單紀錄
        IZGPAENQ_AS400Service service_ENQ = new IZGPAENQ_AS400Service();

        try {
            resultMap = service_ENQ.query(getCustD().getCustID()); //身分證號/統一編號
            appGPAM.setIssue_Mark((String)resultMap.get("ZMARK"));
        }
        catch (Exception ex) {
            System.out.println("Exception from QuoAction.decomposeProjDataArr()=="+ex.getMessage());
        }

        //IZGPAENR：佣金率
        IZGPAENR_AS400Service service_ENR = new IZGPAENR_AS400Service();

        try {
            resultMap = service_ENR.query(agentCD); //經手人代號
            appGPAM.setComm_New(Double.valueOf(resultMap.get("ZCOMMA").toString()));
            appGPAM.setComm_Renew(Double.valueOf(resultMap.get("ZCOMMB").toString()));
        }
        catch (Exception ex) {
            System.out.println("Exception from QuoAction.decomposeProjDataArr()=="+ex.getMessage());
        }
        
        prdtGPAService.persistAppGPAM(appGPAM);
        //================新增方案資料================
        prdtGPAService.persistGPAInsM(GPAInsMList);
        //================計算及更新保費==>檢核並更新狀態==>回傳相關值更新Entity================
        CalcGPAPrmEntity calcGPAPrm = prdtGPAService.getCalcGPAPrm(getDataId(), dataIDVerNo, getLoginId());
    }

}
