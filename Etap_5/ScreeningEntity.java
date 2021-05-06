package com.example.pai2;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "screening", schema = "theater", catalog = "")
public class ScreeningEntity {
    private int id;
    private Date screeningDate;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "screening_date")
    public Date getScreeningDate() {
        return screeningDate;
    }

    public void setScreeningDate(Date screeningDate) {
        this.screeningDate = screeningDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ScreeningEntity that = (ScreeningEntity) o;

        if (id != that.id) return false;
        if (screeningDate != null ? !screeningDate.equals(that.screeningDate) : that.screeningDate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (screeningDate != null ? screeningDate.hashCode() : 0);
        return result;
    }
}
