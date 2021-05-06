package com.example.pai2;

import javax.persistence.*;

@Entity
@Table(name = "seat", schema = "theater", catalog = "")
public class SeatEntity {
    private int id;
    private int seatRow;
    private int seatNum;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "seat_row")
    public int getSeatRow() {
        return seatRow;
    }

    public void setSeatRow(int seatRow) {
        this.seatRow = seatRow;
    }

    @Basic
    @Column(name = "seat_num")
    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SeatEntity that = (SeatEntity) o;

        if (id != that.id) return false;
        if (seatRow != that.seatRow) return false;
        if (seatNum != that.seatNum) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + seatRow;
        result = 31 * result + seatNum;
        return result;
    }
}
