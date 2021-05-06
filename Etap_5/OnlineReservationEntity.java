package com.example.pai2;

import javax.persistence.*;

@Entity
@Table(name = "online_reservation", schema = "theater", catalog = "")
public class OnlineReservationEntity {
    private int id;
    private byte isPaid;
    private byte isCanceled;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "is_paid")
    public byte getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(byte isPaid) {
        this.isPaid = isPaid;
    }

    @Basic
    @Column(name = "is_canceled")
    public byte getIsCanceled() {
        return isCanceled;
    }

    public void setIsCanceled(byte isCanceled) {
        this.isCanceled = isCanceled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OnlineReservationEntity that = (OnlineReservationEntity) o;

        if (id != that.id) return false;
        if (isPaid != that.isPaid) return false;
        if (isCanceled != that.isCanceled) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (int) isPaid;
        result = 31 * result + (int) isCanceled;
        return result;
    }
}
