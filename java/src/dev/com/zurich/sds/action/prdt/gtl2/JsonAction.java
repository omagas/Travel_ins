/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zurich.sds.action.prdt.gtl2;

import com.zurich.sds.action.BaseAction;
import com.zurich.sds.model.config.PrdtCD;
import com.zurich.sds.model.entity.AppGPAMEntity;
import com.zurich.sds.model.entity.CustDetailEntity;
import com.zurich.sds.model.entity.CustDetailEntity.CustRoleCD;
import com.zurich.sds.model.entity.ReasonCdDefEntity;
import com.zurich.sds.service.PrdtGPAService;
import java.util.List;
import java.io.File;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.commons.lang.StringUtils;
import com.zurich.sds.service.PrdtGTL2Service;

/**
 *
 * @author fisher.chiang
 */
@ParentPackage(value = "base")
public class JsonAction extends BaseAction {

    private PrdtGPAService service = PrdtGPAService.getInstance();

    //---------------- Prototype ----------------
    private PrdtGTL2Service gtl2Service = PrdtGTL2Service.getInstance();

    String busKindCD;
    String busKindCDSelectList;
    String statusCD;
    String reasonCD;
    String dataID;
    String dataIDVerNo;
    String reasonDesc;
    String uploadFileNm;
    String msgHTML;
    List<String> buskindCdList;
    List<String> jobCdList;
    List<String> UWUsrCdList;
    List<String> issueBrhCDList;
    List<String> uploadFileList;
    List<String> projHtmlTRList;
    List<String> payHtmlTRList;
    List<ReasonCdDefEntity> reasonCdList;
    CustDetailEntity cust;

    //---------------- Prototype ----------------
    List<String> tourAreaCDList;

    public List<String> getTourAreaCDList() {
        return tourAreaCDList;
    }

    public void setTourAreaCDList(List<String> tourAreaCDList) {
        this.tourAreaCDList = tourAreaCDList;
    }

    public List<String> getBuskindCdList() {
        return buskindCdList;
    }

    public void setBuskindCdList(List<String> buskindCdList) {
        this.buskindCdList = buskindCdList;
    }

    public List<String> getJobCdList() {
        return jobCdList;
    }

    public void setJobCdList(List<String> jobCdList) {
        this.jobCdList = jobCdList;
    }

    public List<String> getUWUsrCdList() {
        return UWUsrCdList;
    }

    public void setUWUsrCdList(List<String> UWUsrCdList) {
        this.UWUsrCdList = UWUsrCdList;
    }

    public List<String> getIssueBrhCDList() {
        return issueBrhCDList;
    }

    public void setIssueBrhCDList(List<String> issueBrhCDList) {
        this.issueBrhCDList = issueBrhCDList;
    }

    public String getBusKindCD() {
        return busKindCD;
    }

    public void setBusKindCD(String busKindCD) {
        this.busKindCD = busKindCD;
    }

    public String getBusKindCDSelectList() {
        return busKindCDSelectList;
    }

    public void setBusKindCDSelectList(String busKindCDSelectList) {
        this.busKindCDSelectList = busKindCDSelectList;
    }

    public CustDetailEntity getCust() {
        return cust;
    }

    public void setCust(CustDetailEntity cust) {
        this.cust = cust;
    }

    public String getDataID() {
        return dataID;
    }

    public void setDataID(String dataID) {
        this.dataID = dataID;
    }

    public String getDataIDVerNo() {
        return dataIDVerNo;
    }

    public void setDataIDVerNo(String dataIDVerNo) {
        this.dataIDVerNo = dataIDVerNo;
    }

    public String getMsgHTML() {
        return msgHTML;
    }

    public void setMsgHTML(String msgHTML) {
        this.msgHTML = msgHTML;
    }

    public List<String> getPayHtmlTRList() {
        return payHtmlTRList;
    }

    public void setPayHtmlTRList(List<String> payHtmlTRList) {
        this.payHtmlTRList = payHtmlTRList;
    }

    public List<String> getProjHtmlTRList() {
        return projHtmlTRList;
    }

    public void setProjHtmlTRList(List<String> projHtmlTRList) {
        this.projHtmlTRList = projHtmlTRList;
    }

    public String getReasonCD() {
        return reasonCD;
    }

    public void setReasonCD(String reasonCD) {
        this.reasonCD = reasonCD;
    }

    public List<ReasonCdDefEntity> getReasonCdList() {
        return reasonCdList;
    }

    public void setReasonCdList(List<ReasonCdDefEntity> reasonCdList) {
        this.reasonCdList = reasonCdList;
    }

    public String getReasonDesc() {
        return reasonDesc;
    }

    public void setReasonDesc(String reasonDesc) {
        this.reasonDesc = reasonDesc;
    }

    public PrdtGPAService getService() {
        return service;
    }

    public void setService(PrdtGPAService service) {
        this.service = service;
    }

    public String getStatusCD() {
        return statusCD;
    }

    public void setStatusCD(String statusCD) {
        this.statusCD = statusCD;
    }

    public List<String> getUploadFileList() {
        return uploadFileList;
    }

    public void setUploadFileList(List<String> uploadFileList) {
        this.uploadFileList = uploadFileList;
    }

    public String getUploadFileNm() {
        return uploadFileNm;
    }

    public void setUploadFileNm(String uploadFileNm) {
        this.uploadFileNm = uploadFileNm;
    }

    @Action(value = "/getGPAHtmlTRList", results = {
        @Result(type = "json")
    })
    public String retrieveGPAHtmlTRList() {
        projHtmlTRList = service.getGPAHtmlTRList(dataID, Integer.valueOf(dataIDVerNo),"01");
        return SUCCESS;
    }

    @Action(value = "/getGPAInputTR", results = {
        @Result(type = "json")
    })
    public String retrieveGPAInputTR() {
        projHtmlTRList = service.getGPAHtmlTRList(dataID, 0,"02",reasonCD);
        return SUCCESS;
    }

    @Action(value = "/getGPASuitProjList", results = {
        @Result(type = "json")
    })
    public String retrieveGPASuitProjList() {
        projHtmlTRList = service.getGPAHtmlTRList(dataID, 0,"04",reasonCD);
        return SUCCESS;
    }

    @Action(value = "/getGPABuskindCDList", results = {
        @Result(type = "json")
    })
    public String retrieveGPABuskindCDList() {
        buskindCdList = service.getGPAHtmlTRList(dataID, 0,"16",reasonCD);
        return SUCCESS;
    }

    @Action(value = "/getGPAJobCDList", results = {
        @Result(type = "json")
    })
    public String retrieveGPAJobCDList() {
        jobCdList = service.getGPAHtmlTRList(dataID, 0,"17",reasonCD);
        return SUCCESS;
    }

    @Action(value = "/getGPANewDataIDVerNo", results = {
        @Result(type = "json")
    })
    public String retrieveNewDataIDVerNo() {
        if (null == dataID || "".equals(dataID)) {
            dataID = commonService.retrieveDataId();
            log.debug("dataId: " + dataID);
        }
        dataIDVerNo = dataID + "-" + service.getGPAHtmlTR(dataID,Integer.valueOf(dataIDVerNo),"05");
        return SUCCESS;
    }

    @Action(value = "/getGPAPDFTitle", results = {
        @Result(type = "json")
    })
    public String retrievePDFTitle() {
        msgHTML = service.getGPAHtmlTR(dataID,Integer.valueOf(dataIDVerNo),"14");
        return SUCCESS;
    }

    @Action(value = "/getGPAAgntCDList", results = {
        @Result(type = "json")
    })
    public String retrieveAgntCDList() {
        msgHTML = service.getGPAHtmlTR(dataID,0,"09",reasonCD);
        return SUCCESS;
    }

    @Action(value = "/getGPAIssueBrhCDList", results = {
        @Result(type = "json")
    })
    public String retrieveIssueBrhCDList() {
        issueBrhCDList = service.getGPAHtmlTRList(dataID,0,"18",getLoginId());
        return SUCCESS;
    }

    @Action(value = "/getGPAUWUsrCdList", results = {
        @Result(type = "json")
    })
    public String retrieveUWUsrCdList() {
        UWUsrCdList = service.getGPAHtmlTRList(dataID,Integer.valueOf(dataIDVerNo),"15",getLoginId());
        return SUCCESS;
    }

    @Action(value = "/getGPAReasonCd", results = {
        @Result(type = "json")
    })
    public String retrieveReasonCd() {
        reasonCdList = service.getReasonCdDef(PrdtCD.GPA, statusCD);
        return SUCCESS;
    }

    @Action(value = "/updateAppGPAM", results = {
        @Result(type = "json")
    })
    public String updateAppGPAM() {
        AppGPAMEntity gpa = service.getAppGPAM(dataID, Integer.valueOf(dataIDVerNo));
        gpa.setImplItemCD(reasonCD);
        gpa.setProcStatusCD(statusCD);
        gpa.setReasonDesc(reasonDesc);
        setMsgHTML(service.getExecGPAAction(gpa, statusCD, getLoginId()));
        //service.updateAppPLLM(pll);
        return SUCCESS;
    }

    @Action(value = "/getGPACustDetail", results = {
        @Result(type = "json")
    })
    public String retrieveCustDetail() {
        cust = commonService.getCustDetailTb(dataID, CustRoleCD.A);
        return SUCCESS;
    }

    @Action(value = "/getGPAFileUploadList", results = {
        @Result(type = "json")
    })
    public String retrieveFileUploadList() {
        uploadFileList = service.getGPAHtmlTRList(dataID,0,"13",getLoginId());
        return SUCCESS;
    }

    @Action(value = "/delGPAFileUploadList", results = {
        @Result(type = "json")
    })
    public String deleteFileUploadList() {
        AppGPAMEntity gpa = new AppGPAMEntity();
        gpa.setDataID(dataID);
        gpa.setDataIDVerNo(0);
        gpa.setReasonDesc(uploadFileNm);
        setMsgHTML(service.getExecGPAAction(gpa, statusCD, getLoginId()));
        if("Y".equals(StringUtils.split(getMsgHTML(), "||")[0])){
            String dir = projectProp.getStringProperty("appMDocu.dir");
            File delFile = new File(dir + uploadFileNm);
            System.out.println("delete " + dir + uploadFileNm + " : " + delFile.delete());
        }
        return SUCCESS;
    }

    //------------  Prototype start -------------
    @Action(value = "/getGTL2TourAreaCD", results = {
        @Result(type = "json")
    })
    public String retrieveGTL2TourAreaCD() {
        tourAreaCDList = gtl2Service.getGTL2HtmlTRList(dataID, 0,"21",reasonCD);
        return SUCCESS;
    }    

    //------------  Prototype end -------------
}
