package com.example.pai2;

import javax.persistence.*;

@Entity
@Table(name = "movie_actor", schema = "theater", catalog = "")
@IdClass(MovieActorEntityPK.class)
public class MovieActorEntity {
    private int movieId;
    private int actorId;

    @Id
    @Column(name = "movie_id")
    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    @Id
    @Column(name = "actor_id")
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

        MovieActorEntity that = (MovieActorEntity) o;

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
