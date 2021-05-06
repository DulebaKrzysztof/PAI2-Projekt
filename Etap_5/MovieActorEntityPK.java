package com.example.pai2;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class MovieActorEntityPK implements Serializable {
    private int movieId;
    private int actorId;

    @Column(name = "movie_id")
    @Id
    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    @Column(name = "actor_id")
    @Id
    public int getActorId() {
        return actorId;
    }

    public void setActorId(int actorId) {
        this.actorId = actorId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MovieActorEntityPK that = (MovieActorEntityPK) o;

        if (movieId != that.movieId) return false;
        if (actorId != that.actorId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = movieId;
        result = 31 * result + actorId;
        return result;
    }
}
