package Entities;

import java.io.Serializable;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ttay2
 */
public class Member implements Serializable {

    int id;
    int raidId;
    String name;
    float totalBid;
    float totalShare;

    public float getTotalShare() {
        return totalShare;
    }

    public void setTotalShare(float totalShare) {
        this.totalShare = totalShare;
    }

    public float getTotalBid() {
        return totalBid;
    }

    public void setTotalBid(float totalBid) {
        this.totalBid = totalBid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRaidId() {
        return raidId;
    }

    public void setRaidId(int raidId) {
        this.raidId = raidId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Member() {
    }

    public Member(String name) {
        this.name = name;
    }

    public static Member parseFromJAXB(JAXBObj.Member aMem) {
        Member convertedMem = new Member();
        convertedMem.setId(aMem.getId());
        convertedMem.setName(aMem.getName());
        convertedMem.setTotalBid(aMem.getTotalBid());
        convertedMem.setTotalShare(aMem.getTotalShare());
        return convertedMem;
    }

    public static JAXBObj.Member parseToJAXB(Member aMem) {
        JAXBObj.Member convertedMem = new JAXBObj.Member();
        convertedMem.setId(aMem.getId());
        convertedMem.setName(aMem.getName());
        convertedMem.setTotalBid(aMem.getTotalBid());
        convertedMem.setTotalShare(aMem.getTotalShare());
        return convertedMem;
    }
}
