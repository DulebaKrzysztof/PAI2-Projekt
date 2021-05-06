package com.example.pai2;

import javax.persistence.*;

@Entity
@Table(name = "ticket_type", schema = "theater", catalog = "")
public class TicketTypeEntity {
    private int id;
    private String ticketType;
    private String price;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ticket_type")
    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    @Basic
    @Column(name = "price")
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TicketTypeEntity that = (TicketTypeEntity) o;

        if (id != that.id) return false;
        if (ticketType != null ? !ticketType.equals(that.ticketType) : that.ticketType != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (ticketType != null ? ticketType.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        return result;
    }
}
