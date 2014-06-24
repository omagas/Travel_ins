/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor. 
 */
package com.zurich.sds.action.prdt.gtl2;

import com.zurich.sds.action.BaseAction;
import com.zurich.sds.model.entity.AppMEntity;
import com.zurich.sds.model.entity.AppMEntity.PrdtCD;
import com.zurich.sds.model.entity.CustDetailEntity;
import com.zurich.sds.model.entity.CustDetailEntity.CustRoleCD;
import com.zurich.sds.service.PrdtGPAService;

/**
 *
 * @author fisher.chiang
 */
public class AbstractGTL2Action extends BaseAction {

    protected PrdtGPAService prdtGPAService = PrdtGPAService.getInstance();
    private String dataId;
    private AppMEntity appM;
    private CustDetailEntity custD;

    protected String getDataId() {
        if (null == dataId) {
            dataId = commonService.retrieveDataId();
            log.debug("dataId: " + this.dataId);
        }
        return dataId;
    }
    
    protected void setDataId(String dataId) {
        this.dataId = dataId;
        log.debug("dataId: " + this.dataId);
    }

    public AppMEntity getAppM() {
        if (null == appM) {
            appM = new AppMEntity(PrdtCD.GPA);
        }
        return appM;
    }

    public void setAppM(AppMEntity appM) {
        this.appM = appM;
    }

    public CustDetailEntity getCustD() {
        if (null == custD) {
            custD = new CustDetailEntity(CustRoleCD.A);
        }
        return custD;
    }

    public void setCustD(CustDetailEntity custD) {
        this.custD = custD;
    }

}
