### Filmy ###
insert into genre values(1,"Horror");
insert into genre values(2,"Komedia");
insert into genre values(3,"Thriller");
insert into director values(1,"James","Wan");
insert into director values(2,"Keenen","Wayans");
insert into director values(3,"Josh","Stolberg");
insert into movie values(1,"Piła 1",1,1,"Brak","90");
insert into movie values(2,"Straszny film 1",2,2,"Brak","90");
insert into movie values(3,"Jigsaw",3,3,"Tak.","90");

insert into actor values (1,"Cary","Elwes");
insert into actor values (2,"Shawn","Wayans");
insert into actor values (3,"Matt","Passmore");
insert into movie_actor values(1,1);
insert into movie_actor values(2,2);
insert into movie_actor values(3,3);
##################################

### Auditorium ###
insert into auditorium values (1,"A1",100);
insert into seat values (1,1,1,1);
insert into seat values (2,1,2,1);
insert into seat values (3,1,3,1);
insert into screening values (1,'2021-05-01 08:00:00',1,1);
insert into screening values (2,'2021-05-01 10:00:00',2,1);
insert into screening values (3,'2021-05-01 12:00:00',3,1);
##############################

### User ###
insert into user values (1,"jan123","kowalski123","jkowalski@gmail.com","Jan","Kowalski");
insert into user values (2,"grzegorz3","brzeszczyczykiewicz","g.brzeszczyczykiewicz@gmail.com","Grzegorz","Brzeszczyczykiewicz");
insert into customer values (1,1);
insert into employee values (1,2);
##############################

### Types ###
insert into ticket_type values (1,"ulgowy","14");
insert into ticket_type values (2,"dorosły","19");
insert into snacks_type values (1,"Cola 0.33",5);
insert into snacks_type values (2,"Popcorn mały",6);
insert into snacks_type values (3,"Popcorn średni",9);
##############################

### Ticket and such ###
insert into online_reservation values (1,1,1,0);
insert into invoice values (1,'2021-05-01',1);
insert into snacks values(1,3,1,1);
insert into ticket values (1,1,1,2,1,1);
insert into ticket values (2,2,2,2,1,1);
insert into ticket values (3,2,3,1,1,1);
##############################