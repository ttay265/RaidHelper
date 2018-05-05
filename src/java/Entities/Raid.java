/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ttay2
 */
public class Raid implements Serializable {

    int id;
    List<Member> members;
    Date createdDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Raid() {
        this.members = new ArrayList<>();
    }

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public Member findMember(String name) {
        for (Member c : this.members) {
            return name == c.getName() ? c : null;
        }
        return null;
    }

    public boolean addBid(String name, String loot, float amount) {
        float currShare;
        float currBid;

        // Calculate share for members
        float share = amount / (float) (this.members.size() - 1);
        // Accumulate share for members
        for (int i = 0; i < this.members.size(); i++) {
            if (!this.members.get(i).getName().equals(name)) { //if mem not bidder
                currShare = this.members.get(i).getTotalShare();
                currShare += share;
                this.members.get(i).setTotalShare(currShare);
            } else {
                currBid = this.members.get(i).getTotalBid();
                currBid += amount;
                this.members.get(i).setTotalBid(currBid);
            }
        }
        // create Share
        // save Share to DB
        return true;
    }

    public static Raid parseFromJAXB(JAXBObj.Raid aRaid) {
        Date crDate = aRaid.getCreatedDate().toGregorianCalendar().getTime();
        Raid convertedRaid = new Raid();

        List<Member> members = new ArrayList<>();
        for (JAXBObj.Member m : aRaid.getMember()) {
            members.add(Member.parseFromJAXB(m));
        }
        convertedRaid.setCreatedDate(crDate);
        return convertedRaid;
    }
}
