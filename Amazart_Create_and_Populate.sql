CREATE TABLE review (
  review_id varchar(6)  not null,
  event_grade varchar(1),
  review_description text,
  PRIMARY KEY (review_id)
);

CREATE TABLE expert (
  expert_id varchar(6)  not null,
  expert_name text ,
  field_of_expertise text,
  expert_certifications text,
  PRIMARY KEY (expert_id)
);


CREATE TABLE evaluation (
  evaluation_id varchar(6)  not null,
  monetary_value float,
  artwork_analysis text,
  evaluation_date date,
  expert_id varchar(6)  not null,
  PRIMARY KEY (evaluation_id),
  FOREIGN KEY (expert_id) REFERENCES expert(expert_id)
);

CREATE TABLE artist (
  artist_id varchar(6)  not null,
  artist_name text,
  phone text,
  artist_address text,
  city text,
  country text,
  postal_code text,
  email text,
  artist_description text,
  year_of_birth int,
  PRIMARY KEY (artist_id)
);


CREATE TABLE artwork (
  artwork_id varchar(6)  not null,
  artwork_name text ,
  artwork_medium text  ,
  price float ,
  length_cm float,
  width_cm float,
  height_cm float,
  tags text, # ?????????????????????????????????????????????????????????????????????????????????????/
  aw_description text,
  color text,
  evaluation_id varchar(6),
  PRIMARY KEY (artwork_id),
  FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id)
);

CREATE TABLE orders (
  order_id varchar(6)  not null,
  date_placed date,
  date_shipped date,
  date_received date,
  purchased_price float,
  artwork_id varchar(6),
  PRIMARY KEY (order_id),
  FOREIGN KEY (artwork_id) REFERENCES artwork(artwork_id)
);

CREATE TABLE buyer (
  buyer_id varchar(6)  not null,
  buyer_name text ,
  email text ,
  buyer_address text,
  city text,
  country text,
  postal_code text,
  order_id varchar(6),
  PRIMARY KEY (buyer_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
  #shipping_address text not null
);



CREATE TABLE event_aw (
  event_id varchar(6)  not null,
  event_name text ,
  type_of_event text ,
  event_address text,
  city text,
  country text,
  postal_code text,
  start_time timestamp ,
  end_time timestamp ,
  number_of_artworks int,
  review_id varchar(6),
  PRIMARY KEY (event_id),
  FOREIGN KEY (review_id) REFERENCES review(review_id)
);



# ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Relationships tables (Many To Many):

CREATE TABLE event_artist (
event_id varchar(6),
artist_id varchar(6),
PRIMARY KEY (event_id, artist_id),
FOREIGN KEY (event_id) REFERENCES event_aw(event_id),
FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE artist_artwork (
artist_id varchar(6),
artwork_id varchar(6),
PRIMARY KEY (artist_id, artwork_id),
FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
FOREIGN KEY (artwork_id) REFERENCES artwork(artwork_id)
);


















insert into review (review_id, event_grade, review_description) values (1, 8, 'Vivamus tortor.');
insert into review (review_id, event_grade, review_description) values (2, 7, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.');
insert into review (review_id, event_grade, review_description) values (3, 7, 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.');
insert into review (review_id, event_grade, review_description) values (4, 7, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.');
insert into review (review_id, event_grade, review_description) values (5, 9, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.');
insert into review (review_id, event_grade, review_description) values (6, 7, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.');
insert into review (review_id, event_grade, review_description) values (7, 5, 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.');
insert into review (review_id, event_grade, review_description) values (8, 3, 'Nulla suscipit ligula in lacus.');
insert into review (review_id, event_grade, review_description) values (9, 4, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.');
insert into review (review_id, event_grade, review_description) values (10, 7, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.');
insert into review (review_id, event_grade, review_description) values (11, 8, 'Vestibulum rutrum rutrum neque.');
insert into review (review_id, event_grade, review_description) values (12, 5, 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.');
insert into review (review_id, event_grade, review_description) values (13, 9, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.');
insert into review (review_id, event_grade, review_description) values (14, 6, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.');
insert into review (review_id, event_grade, review_description) values (15, 2, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.');
insert into review (review_id, event_grade, review_description) values (16, 8, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.');
insert into review (review_id, event_grade, review_description) values (17, 8, 'Duis consequat dui nec nisi volutpat eleifend.');
insert into review (review_id, event_grade, review_description) values (18, 8, 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into review (review_id, event_grade, review_description) values (19, 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
insert into review (review_id, event_grade, review_description) values (20, 1, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.');
insert into review (review_id, event_grade, review_description) values (21, 5, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.');
insert into review (review_id, event_grade, review_description) values (22, 6, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.');
insert into review (review_id, event_grade, review_description) values (23, 2, 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
insert into review (review_id, event_grade, review_description) values (24, 2, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.');
insert into review (review_id, event_grade, review_description) values (25, 5, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into review (review_id, event_grade, review_description) values (26, 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.');
insert into review (review_id, event_grade, review_description) values (27, 7, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.');
insert into review (review_id, event_grade, review_description) values (28, 3, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.');
insert into review (review_id, event_grade, review_description) values (29, 6, 'Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.');
insert into review (review_id, event_grade, review_description) values (30, 9, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.');
insert into review (review_id, event_grade, review_description) values (31, 2, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.');
insert into review (review_id, event_grade, review_description) values (32, 9, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.');
insert into review (review_id, event_grade, review_description) values (33, 7, 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.');
insert into review (review_id, event_grade, review_description) values (34, 9, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.');
insert into review (review_id, event_grade, review_description) values (35, 8, 'Pellentesque at nulla.');
insert into review (review_id, event_grade, review_description) values (36, 4, 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.');
insert into review (review_id, event_grade, review_description) values (37, 6, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.');
insert into review (review_id, event_grade, review_description) values (38, 9, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.');
insert into review (review_id, event_grade, review_description) values (39, 8, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into review (review_id, event_grade, review_description) values (40, 3, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.');
insert into review (review_id, event_grade, review_description) values (41, 7, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.');
insert into review (review_id, event_grade, review_description) values (42, 6, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into review (review_id, event_grade, review_description) values (43, 7, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into review (review_id, event_grade, review_description) values (44, 3, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into review (review_id, event_grade, review_description) values (45, 7, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.');
insert into review (review_id, event_grade, review_description) values (46, 2, 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
insert into review (review_id, event_grade, review_description) values (47, 3, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
insert into review (review_id, event_grade, review_description) values (48, 2, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.');
insert into review (review_id, event_grade, review_description) values (49, 4, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.');
insert into review (review_id, event_grade, review_description) values (50, 3, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.');

insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (1, 'Talia Kalvin', 'Movies', 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (2, 'Isaac Patillo', 'Beauty', 'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (3, 'Amerigo Budgey', 'Computers', 'pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (4, 'Rona Jorczyk', 'Beauty', 'vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (5, 'Gale Ribou', 'Kids', 'integer pede justo lacinia eget tincidunt eget tempus vel pede');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (6, 'Barry Neubigging', 'Music', 'adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (7, 'Inglis Tenpenny', 'Industrial', 'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (8, 'Burke Jones', 'Games', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (9, 'Darcee Gregon', 'Music', 'hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque');
insert into expert (expert_id, expert_name, field_of_expertise, expert_certifications) values (10, 'Skippie Slixby', 'Industrial', 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst');


insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (1, 558179, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', '2020-10-09 12:49:19', 1);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (2, 218384, 'Morbi a ipsum. Integer a nibh. In quis justo.', '2021-01-01 17:05:29', 2);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (3, 47962, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2020-11-19 23:52:53', 4);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (4, 822570, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', '2020-12-24 11:48:52', 5);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (5, 974980, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2021-09-06 22:32:17', 2);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (6, 735607, 'Suspendisse potenti. Nullam porttitor lacus at turpis.', '2020-08-20 01:07:58',5);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (7, 944712, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', '2021-04-06 08:53:52', 8);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (8, 951857, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', '2020-12-12 02:33:02', 10);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (9, 57328, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', '2021-03-15 11:43:14', 1);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (10, 921252, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', '2021-02-02 10:56:02', 5);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (11, 185952, 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', '2021-05-05 05:57:03', 6);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (12, 663632, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2021-02-21 01:48:05', 9);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (13, 767311, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2020-10-05 14:54:00', 2);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (14, 806915, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', '2021-06-13 05:29:18', 5);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (15, 998451, 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2021-02-14 22:35:15', 4);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (16, 929941, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2021-05-05 02:15:38', 1);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (17, 573653, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '2020-11-18 01:16:30', 7);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (18, 632327, 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', '2020-10-31 05:25:11', 7);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (19, 55982, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', '2020-08-07 04:17:18', 1);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (20, 625854, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2021-03-31 18:07:38', 3);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (21, 200698, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', '2020-12-04 09:28:40', 6);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (22, 113621, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2020-12-04 07:00:49', 8);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (23, 834987, 'Curabitur gravida nisi at nibh.', '2021-04-30 18:11:18', 9);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (24, 64226, 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2020-10-12 01:56:44', 10);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (25, 343489, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', '2021-04-04 14:48:22', 5);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (26, 184539, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '2021-05-16 04:55:10', 2);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (27, 512002, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', '2020-12-30 15:26:52', 7);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (28, 791942, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2021-06-27 11:58:25', 9);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (29, 460038, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', '2020-10-12 08:07:56', 3);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (30, 482499, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-01-27 05:16:44', 8);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (31, 711372, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', '2021-04-01 13:45:33', 4);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (32, 563613, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2021-02-17 12:42:45', 3);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (33, 275985, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2020-09-13 09:36:19', 9);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (34, 785251, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2021-01-21 06:15:48', 6);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (35, 523749, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020-10-19 17:12:37', 4);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (36, 554358, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', '2020-12-29 17:01:31', 6);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (37, 264778, 'Quisque porta volutpat erat.', '2020-12-04 08:32:00', 1);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (38, 574928, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2021-08-02 10:31:45', 2);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (39, 691454, 'Proin risus.', '2021-06-26 14:14:49', 5);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (40, 307714, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '2021-04-05 01:53:41', 9);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (41, 437363, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', '2021-03-17 19:50:43', 10);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (42, 897734, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', '2020-11-28 16:42:39', 2);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (43, 790625, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', '2020-08-16 15:03:25', 8);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (44, 969515, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2020-08-09 12:10:09', 9);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (45, 621361, 'Nullam varius. Nulla facilisi.', '2021-02-11 14:13:39', 3);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (46, 437557, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', '2021-05-19 22:59:00', 2);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (47, 618856, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2021-03-10 18:56:59', 7);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (48, 118263, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', '2020-12-20 13:05:07', 1);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (49, 848077, 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', '2021-08-14 07:10:12', 8);
insert into evaluation (evaluation_id, monetary_value, artwork_analysis, evaluation_date, expert_id) values (50, 974538, 'Suspendisse ornare consequat lectus.', '2021-06-24 04:06:26', 7);



insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (1, 'Averyl Raiman', '(425) 8570556', '735 Heath Street', 'Sorren Daya', 'Indonesia', null, 'araiman0@last.fm', 'Devolved cohesive superstructure', 1966);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (2, 'Eveleen Seagrave', '(647) 5996659', '648 Gateway Hill', 'Calumpit', 'Philippines', '3003', 'eseagrave1@google.es', 'Front-line coherent groupware', 1995);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (3, 'Selby Killwick', '(444) 9179833', '18 Westport Park', 'Thị Trấn Thất Khê', 'Vietnam', null, 'skillwick2@shop-pro.jp', 'Balanced eco-centric flexibility', 1974);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (4, 'Lita Peery', '(167) 5276320', '16712 Summit Court', 'Kyurdarmir', 'Azerbaijan', null, 'lpeery3@narod.ru', 'Future-proofed zero tolerance infrastructure', 1994);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (5, 'Jeffie Rawcliffe', '(822) 3024153', '0 Shasta Pass', 'K’anak’erravan', 'Armenia', null, 'jrawcliffe4@foxnews.com', 'Grass-roots non-volatile superstructure', 1982);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (6, 'Penrod Pergens', '(145) 3373936', '2 Lotheville Plaza', 'Fort Abbās', 'Pakistan', '62021', 'ppergens5@illinois.edu', 'Distributed 24/7 concept', 1994);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (7, 'Deena Longbottom', '(614) 8691086', '1 Blaine Hill', 'Columbus', 'United States', '43231', 'dlongbottom6@yahoo.com', 'Team-oriented radical core', 1966);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (8, 'Rowena Bartle', '(215) 5999651', '289 Dexter Avenue', 'Villa del Carmen', 'Uruguay', null, 'rbartle7@desdev.cn', 'Organized transitional emulation', 1970);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (9, 'Zea Bris', '(923) 5532440', '892 Spaight Plaza', 'Stockholm', 'Sweden', '113 03', 'zbris8@sciencedirect.com', 'Devolved national challenge', 1985);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (10, 'Daryl Kier', '(742) 5137606', '2666 Cambridge Place', 'Rosário do Sul', 'Brazil', '97590-000', 'dkier9@twitter.com', 'User-friendly solution-oriented software', 1989);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (11, 'Farleigh Taill', '(299) 4950593', '956 Meadow Vale Avenue', 'Erdaojiang', 'China', null, 'ftailla@shinystat.com', 'Customizable maximized process improvement', 1990);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (12, 'Sunny Mattei', '(991) 5518629', '6764 Clemons Point', 'Ujar', 'Azerbaijan', null, 'smatteib@twitter.com', 'Focused fresh-thinking algorithm', 1969);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (13, 'Johny Rodenhurst', '(458) 1655172', '08 Ramsey Drive', 'Banyuurip', 'Indonesia', null, 'jrodenhurstc@stanford.edu', 'Re-contextualized eco-centric Graphic Interface', 1971);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (14, 'Meier Verriour', '(577) 4512471', '700 Florence Point', 'Město Libavá', 'Czech Republic', '783 06', 'mverriourd@squidoo.com', 'Monitored 24/7 frame', 2000);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (15, 'Augustine Kilgour', '(575) 5867987', '08353 Victoria Center', 'Bourges', 'France', '18035 CEDEX', 'akilgoure@usatoday.com', 'Up-sized encompassing circuit', 1970);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (16, 'Clemmy Brehault', '(559) 7024862', '80 Anhalt Avenue', 'Sangmu', 'China', null, 'cbrehaultf@usnews.com', 'Mandatory secondary workforce', 1974);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (17, 'Gabbey Behnecken', '(745) 2192460', '8 Elgar Center', 'Pancoran', 'Indonesia', null, 'gbehneckeng@unesco.org', 'Open-architected optimizing intranet', 1974);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (18, 'Juan De La Cote', '(408) 1580560', '595 Scofield Trail', 'Shahbā', 'Syria', null, 'jdeh@imgur.com', 'Cross-platform composite open system', 1977);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (19, 'Delbert Hasely', '(147) 1504747', '252 Independence Junction', 'Luwingu', 'Zambia', null, 'dhaselyi@cafepress.com', 'Persistent bandwidth-monitored middleware', 1990);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (20, 'Leanora Petrie', '(827) 9229746', '1158 Sunfield Drive', 'Taverny', 'France', '95154 CEDEX', 'lpetriej@simplemachines.org', 'Expanded client-server implementation', 1969);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (21, 'Care Rydeard', '(889) 4884903', '5 Fallview Terrace', 'Liuhao', 'China', null, 'crydeardk@taobao.com', 'Exclusive needs-based artificial intelligence', 1999);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (22, 'Karola Bemrose', '(911) 2526727', '100 La Follette Crossing', 'Buenavista', 'Mexico', '38796', 'kbemrosel@patch.com', 'Horizontal national matrix', 2002);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (23, 'Layney Gellan', '(824) 7274586', '9 Scofield Street', 'Stockholm', 'Sweden', '114 24', 'lgellanm@ameblo.jp', 'Universal bi-directional data-warehouse', 1999);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (24, 'Vivienne Kuhnel', '(320) 8741513', '0 Carberry Trail', 'Szubin', 'Poland', '89-200', 'vkuhneln@dagondesign.com', 'Ergonomic exuding complexity', 1993);
insert into artist (artist_id, artist_name, phone, artist_address, city, country, postal_code, email, artist_description, year_of_birth) values (25, 'Rory Gullam', '(287) 3397791', '4 Kenwood Court', 'Křížová', 'Czech Republic', '794 01', 'rgullamo@merriam-webster.com', 'Devolved methodical parallelism', 1996);


insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (1, 'attitude', '28809', 188021, 57, 20, 112, 'orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Khaki', 49);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (2, 'radical', '9', 736876, 77, 372, 411, 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Orange', 11);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (3, 'capability', '22152', 70293, 146, 168, 311, 'nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 'Pink', 36);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (4, 'Multi-tiered', '4', 739051, 27, 291, 135, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 'Maroon', 5);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (5, 'flexibility', '31003', 977302, 351, 489, 42, 'eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis', 'Duis mattis egestas metus.', 'Violet', 35);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (6, 'installation', '00476', 314570, 63, 482, 13, 'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'Crimson', 32);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (7, 'bottom-line', '615', 871646, 181, 165, 39, 'blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', 'Purple', 14);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (8, 'well-modulated', '63854', 499809, 252, 30, 475, 'tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 'Mauv', 18);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (9, 'moratorium', '38245', 467407, 121, 295, 415, 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Teal', 6);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (10, 'Right-sized', '80', 543160, 353, 372, 110, 'morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla', 'Curabitur at ipsum ac tellus semper interdum.', 'Khaki', 45);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (11, 'hub', '15460', 484056, 201, 307, 281, 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'Blue', 42);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (12, 'foreground', '6', 494804, 36, 345, 275, 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu', 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'Violet', 35);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (13, 'context-sensitive', '853', 137777, 85, 219, 308, 'ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'Indigo', 27);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (14, 'web-enabled', '2311', 437982, 456, 470, 434, 'ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'Fuscia', 10);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (15, 'Extended', '4', 168118, 207, 167, 265, 'imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Khaki', 33);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (16, 'encompassing', '0', 771931, 9, 73, 122, 'vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Pink', 33);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (17, 'Multi-channelled', '7573', 402968, 262, 336, 499, 'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed', 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'Purple', 2);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (18, 'productivity', '66028', 182747, 360, 411, 338, 'ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra', 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'Turquoise', 10);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (19, 'orchestration', '7', 339792, 37, 308, 192, 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 'Khaki', 26);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (20, 'Operative', '6', 184400, 473, 7, 371, 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'Goldenrod', 3);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (21, 'monitoring', '8546', 636478, 220, 486, 461, 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo', 'Aliquam quis turpis eget elit sodales scelerisque.', 'Blue', 29);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (22, 'neutral', '6503', 570199, 378, 223, 393, 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Purple', 25);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (23, 'client-server', '3', 189527, 132, 499, 404, 'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Mauv', 12);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (24, 'alliance', '12378', 344502, 186, 268, 288, 'in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Khaki', 50);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (25, 'methodical', '3292', 897295, 34, 293, 299, 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'Maroon', 9);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (26, 'interface', '2304', 242533, 294, 231, 478, 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Khaki', 34);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (27, 'functionalities', '2', 640070, 306, 2, 456, 'duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo', 'Integer tincidunt ante vel ipsum.', 'Orange', 9);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (28, 'Phased', '34150', 272889, 346, 358, 249, 'ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam', 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 'Red', 21);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (29, 'open architecture', '6', 274765, 21, 80, 463, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'Khaki', 25);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (30, 'function', '26059', 128248, 310, 218, 344, 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'Crimson', 1);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (31, 'Grass-roots', '25419', 961242, 84, 29, 328, 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 'Turquoise', 13);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (32, 'time-frame', '1081', 929790, 54, 153, 235, 'consequat ut nulla sed accumsan felis ut at dolor quis odio', 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'Yellow', 40);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (33, 'well-modulated', '68', 36130, 302, 308, 254, 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'Fuscia', 15);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (34, 'exuding', '00436', 23871, 483, 246, 432, 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'Purple', 17);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (35, 'standardization', '3', 245452, 41, 460, 307, 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 'Orange', 30);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (36, 'data-warehouse', '53', 752930, 296, 325, 238, 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.', 'Aquamarine', 8);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (37, 'implementation', '322', 910889, 102, 283, 456, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Maroon', 28);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (38, 'responsive', '3521', 153357, 136, 2, 163, 'ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'Crimson', 24);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (39, 'framework', '9986', 975863, 235, 287, 392, 'mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac', 'Integer ac leo. Pellentesque ultrices mattis odio.', 'Orange', 46);
insert into artwork (artwork_id, artwork_name, artwork_medium, price, length_cm, width_cm, height_cm, tags, aw_description, color, evaluation_id) values (40, 'stable', '509', 627671, 334, 422, 269, 'aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Pink', 43);


insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (1, '2021-06-04 03:53:42', '2021-07-21 05:27:04', '2021-05-05 19:54:19', 267252, 18);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (2, '2021-07-02 09:34:25', '2021-07-01 00:02:14', '2021-08-24 03:30:19', 410062, 3);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (3, '2021-01-25 10:00:48', '2021-07-02 04:14:36', '2021-05-13 18:48:26', 129029, 2);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (4, '2020-08-27 09:11:10', '2021-07-08 04:05:23', '2021-05-09 05:41:28', 854356, 11);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (5, '2020-08-04 18:04:59', '2021-02-08 18:53:19', '2021-09-02 20:04:01', 849000, 28);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (6, '2021-02-05 10:33:55', '2021-03-09 16:58:21', '2021-07-30 20:52:31', 949833, 40);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (7, '2020-12-03 06:40:55', '2021-07-06 16:20:01', '2021-01-28 09:43:01', 248109, 5);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (8, '2020-07-13 07:02:02', '2020-12-18 22:06:45', '2020-11-03 05:03:33', 145370, 19);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (9, '2020-11-19 20:39:27', '2021-04-29 22:10:28', '2020-11-26 11:12:34', 814860, 6);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (10, '2020-09-04 01:21:42', '2021-04-22 19:27:53', '2021-02-08 10:15:27', 924097, 32);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (11, '2021-03-22 15:26:37', '2020-10-20 01:54:36', '2020-12-10 06:34:47', 981611, 36);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (12, '2021-04-07 22:54:57', '2021-03-25 01:26:18', '2020-11-24 09:16:11', 31992, 15);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (13, '2020-12-04 17:23:29', '2021-08-02 12:12:04', '2021-01-03 21:49:43', 163355, 34);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (14, '2021-06-08 21:29:51', '2021-04-26 00:45:17', '2021-06-20 20:43:47', 909031, 26);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (15, '2021-02-17 12:42:32', '2020-08-18 23:18:59', '2020-10-19 12:42:24', 836493, 20);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (16, '2021-06-07 10:01:21', '2020-09-24 02:20:31', '2020-08-30 18:39:39', 669209, 13);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (17, '2021-04-04 07:34:51', '2020-09-22 21:05:54', '2021-08-06 23:59:32', 218362, 37);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (18, '2021-06-13 17:59:42', '2021-01-17 18:42:44', '2021-02-14 12:48:05', 805572, 7);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (19, '2020-10-16 19:02:36', '2021-03-06 05:46:33', '2021-04-12 11:17:21', 991828, 17);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (20, '2020-10-12 16:32:19', '2020-10-06 21:31:03', '2020-08-19 13:22:33', 979990, 35);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (21, '2021-04-23 11:03:48', '2020-08-03 22:04:06', '2020-11-13 13:17:42', 84671, 27);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (22, '2020-12-19 04:10:01', '2020-08-20 08:02:00', '2021-09-01 04:03:59', 209114, 12);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (23, '2021-02-28 06:55:46', '2020-12-19 14:43:26', '2021-09-01 00:31:07', 378157, 10);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (24, '2021-04-22 18:33:33', '2020-12-17 06:10:02', '2021-03-16 23:24:01', 486510, 23);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (25, '2021-07-09 14:12:55', '2020-09-07 00:35:40', '2020-09-25 14:15:19', 642325, 24);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (26, '2021-05-15 17:48:42', '2021-08-02 09:59:30', '2021-06-13 14:32:30', 290915, 33);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (27, '2020-07-30 22:32:19', '2020-12-23 09:07:46', '2020-12-03 07:46:24', 807254, 16);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (28, '2020-12-13 17:24:58', '2021-05-26 09:45:38', '2020-11-25 12:24:27', 870235, 14);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (29, '2021-02-03 19:12:13', '2021-07-14 10:04:37', '2021-01-06 05:54:23', 836774, 30);
insert into orders (order_id, date_placed, date_shipped, date_received, purchased_price, artwork_id) values (30, '2020-12-05 04:22:52', '2020-11-02 12:42:31', '2020-11-22 20:44:39', 356368, 4);






insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (1, 'Tyrone McCluskey', 'tmccluskey0@photobucket.com', '8987 Portage Crossing', 'Czech Republic', '696 81', 1);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (2, 'Leandra Advani', 'ladvani1@friendfeed.com', '87 Bluejay Way', 'China', null, 2);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (3, 'Aura Vasyutichev', 'avasyutichev2@blogspot.com', '70 Lukken Terrace', 'Comoros', null, 3);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (4, 'Ollie Vye', 'ovye3@networkadvertising.org', '075 Forest Run Parkway', 'Thailand', '67130', 4);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (5, 'Dorey Brandacci', 'dbrandacci4@ocn.ne.jp', '510 Shoshone Drive', 'China', null, 5);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (6, 'Godwin Brisse', 'gbrisse5@yellowbook.com', '9819 Oneill Road', 'Czech Republic', '364 52', 6);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (7, 'Chane Cordet', 'ccordet6@biglobe.ne.jp', '745 Moose Terrace', 'Russia', '303036', 7);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (8, 'Roseanna Bilby', 'rbilby7@upenn.edu', '30806 Meadow Ridge Pass', 'Japan', '350-1213', 8);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (9, 'Norina Fittis', 'nfittis8@nhs.uk', '74 Fallview Way', 'Thailand', '70170', 9);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (10, 'Jenni Worsalls', 'jworsalls9@technorati.com', '87 Hoepker Plaza', 'Nigeria', null, 10);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (11, 'Lotty Stopper', 'lstoppera@ibm.com', '1505 Packers Park', 'Indonesia', null, 11);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (12, 'Harman Rangall', 'hrangallb@vkontakte.ru', '71 Grover Way', 'Syria', null, 12);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (13, 'Liesa Glanville', 'lglanvillec@github.io', '30 Lakeland Lane', 'China', null, 13);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (14, 'Enrichetta Demeter', 'edemeterd@noaa.gov', '06 Red Cloud Road', 'Morocco', null, 14);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (15, 'Sloan Legrice', 'slegricee@live.com', '15 Jenifer Point', 'China', null, 15);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (16, 'Doria Tummasutti', 'dtummasuttif@csmonitor.com', '17038 4th Junction', 'Ethiopia', null, 16);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (17, 'Gerianne Clemencon', 'gclemencong@hhs.gov', '05713 Lerdahl Street', 'China', null, 17);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (18, 'Ingaborg Piche', 'ipicheh@sogou.com', '852 Maywood Street', 'China', null, 18);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (19, 'Romona Thraves', 'rthravesi@yellowpages.com', '43 Pierstorff Trail', 'Serbia', null, 19);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (20, 'Almeda Whaites', 'awhaitesj@globo.com', '30 Chive Parkway', 'Egypt', null, 20);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (21, 'Meagan Bawcock', 'mbawcockk@shop-pro.jp', '1883 Hazelcrest Place', 'Sweden', '111 95', 21);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (22, 'Kandy Jaumet', 'kjaumetl@chronoengine.com', '91 Ryan Circle', 'Portugal', '4990-540', 22);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (23, 'Simmonds Shelvey', 'sshelveym@ucoz.ru', '07 American Ash Crossing', 'Croatia', '51253', 23);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (24, 'Rosemaria Gresty', 'rgrestyn@istockphoto.com', '4238 Fairview Street', 'Vietnam', null, 24);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (25, 'Jermaine Vallery', 'jvalleryo@ft.com', '7268 Anniversary Terrace', 'Malta', 'MXK', 25);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (26, 'Osgood Kleinmann', 'okleinmannp@businessinsider.com', '79452 Straubel Pass', 'China', null, 26);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (27, 'Caspar Ruselin', 'cruselinq@cam.ac.uk', '4240 Bashford Point', 'Malaysia', '27620', 27);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (28, 'Joelle Shill', 'jshillr@typepad.com', '7590 Buhler Crossing', 'Tunisia', null, 28);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (29, 'Donalt Pymer', 'dpymers@hp.com', '16 Fuller Pass', 'Philippines', '2509', 29);
insert into buyer (buyer_id, buyer_name, email, buyer_address, city, postal_code, order_id) values (30, 'Amy Smallman', 'asmallmant@nifty.com', '1 Vidon Way', 'Indonesia', null, 30);



insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (1, 'MKZ', 1, '1 3rd Pass', 'Xinfeng', 'China', null, '2020-09-09 20:14:02', '2020-10-24 15:57:02', 19, 23);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (2, 'RX', 1, '7 Mayfield Hill', 'Kedungreja', 'Indonesia', null, '2020-09-07 12:21:02', '2020-09-29 18:41:23', 10, 23);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (3, 'G-Series G10', 2, '04 Mayer Park', 'Donan', 'Indonesia', null, '2020-10-27 20:06:32', '2021-03-19 03:43:12', 17, 40);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (4, 'HS', 1, '724 Loomis Court', 'Sodankylä', 'Finland', '99601', '2021-09-13 23:37:25', '2021-08-06 01:00:35', 18, 27);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (5, 'B-Series', 2, '21754 Cordelia Avenue', 'Krajan Karangwage', 'Indonesia', null, '2021-01-17 19:17:11', '2021-08-06 04:34:41', 11, 39);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (6, 'X-Type', 2, '39 Morrow Alley', 'Bontang', 'Indonesia', null, '2021-08-12 02:35:34', '2020-11-12 14:35:37', 17, 11);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (7, 'Terrain', 3, '596 Tennyson Lane', 'Newport News', 'United States', '23605', '2020-12-05 00:37:44', '2021-06-21 06:05:56', 18, 10);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (8, 'Discovery Series II', 3, '10 Vidon Plaza', 'Ålesund', 'Norway', '6015', '2021-03-02 03:11:15', '2021-01-30 17:06:54', 4, 28);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (9, 'Quest', 3, '5306 Springs Center', 'Potoru', 'Sierra Leone', null, '2020-11-08 04:17:08', '2021-05-15 04:00:38', 2, 10);
insert into event_aw (event_id, event_name, type_of_event, event_address, city, country, postal_code, start_time, end_time, number_of_artworks, review_id) values (10, 'E350', 1, '45438 Shoshone Crossing', 'Sida', 'Thailand', '30430', '2021-04-08 09:45:53', '2020-09-04 00:39:17', 15, 10);


insert into event_artist (event_id, artist_id) values (7, 1);
insert into event_artist (event_id, artist_id) values (4, 11);
insert into event_artist (event_id, artist_id) values (1, 19);
insert into event_artist (event_id, artist_id) values (1, 14);
insert into event_artist (event_id, artist_id) values (2, 3);
insert into event_artist (event_id, artist_id) values (5, 12);
insert into event_artist (event_id, artist_id) values (8, 6);
insert into event_artist (event_id, artist_id) values (3, 8);
insert into event_artist (event_id, artist_id) values (7, 6);
insert into event_artist (event_id, artist_id) values (8, 13);
insert into event_artist (event_id, artist_id) values (6, 10);
insert into event_artist (event_id, artist_id) values (4, 12);
insert into event_artist (event_id, artist_id) values (2, 18);
insert into event_artist (event_id, artist_id) values (4, 3);
insert into event_artist (event_id, artist_id) values (6, 7);
insert into event_artist (event_id, artist_id) values (5, 19);
insert into event_artist (event_id, artist_id) values (8, 14);
insert into event_artist (event_id, artist_id) values (6, 8);
insert into event_artist (event_id, artist_id) values (4, 18);
insert into event_artist (event_id, artist_id) values (9, 2);
insert into event_artist (event_id, artist_id) values (3, 7);
insert into event_artist (event_id, artist_id) values (6, 13);
insert into event_artist (event_id, artist_id) values (1, 9);
insert into event_artist (event_id, artist_id) values (1, 7);
insert into event_artist (event_id, artist_id) values (8, 2);
insert into event_artist (event_id, artist_id) values (7, 22);
insert into event_artist (event_id, artist_id) values (8, 15);
insert into event_artist (event_id, artist_id) values (5, 2);
insert into event_artist (event_id, artist_id) values (1, 10);
insert into event_artist (event_id, artist_id) values (7, 4);
insert into event_artist (event_id, artist_id) values (8, 8);
insert into event_artist (event_id, artist_id) values (3, 6);
insert into event_artist (event_id, artist_id) values (2, 19);
insert into event_artist (event_id, artist_id) values (2, 20);
insert into event_artist (event_id, artist_id) values (10, 22);
insert into event_artist (event_id, artist_id) values (1, 22);
insert into event_artist (event_id, artist_id) values (2, 22);
insert into event_artist (event_id, artist_id) values (8, 17);
insert into event_artist (event_id, artist_id) values (2, 9);
insert into event_artist (event_id, artist_id) values (4, 16);
insert into event_artist (event_id, artist_id) values (9, 13);
insert into event_artist (event_id, artist_id) values (7, 8);
insert into event_artist (event_id, artist_id) values (3, 1);
insert into event_artist (event_id, artist_id) values (2, 1);
insert into event_artist (event_id, artist_id) values (3, 19);
insert into event_artist (event_id, artist_id) values (10, 2);


insert into artist_artwork (artist_id, artwork_id) values (12, 8);
insert into artist_artwork (artist_id, artwork_id) values (23, 40);
insert into artist_artwork (artist_id, artwork_id) values (10, 39);
insert into artist_artwork (artist_id, artwork_id) values (9, 19);
insert into artist_artwork (artist_id, artwork_id) values (24, 30);
insert into artist_artwork (artist_id, artwork_id) values (17, 30);
insert into artist_artwork (artist_id, artwork_id) values (20, 1);
insert into artist_artwork (artist_id, artwork_id) values (8, 28);
insert into artist_artwork (artist_id, artwork_id) values (2, 24);
insert into artist_artwork (artist_id, artwork_id) values (5, 27);
insert into artist_artwork (artist_id, artwork_id) values (11, 8);
insert into artist_artwork (artist_id, artwork_id) values (16, 23);
insert into artist_artwork (artist_id, artwork_id) values (11, 13);
insert into artist_artwork (artist_id, artwork_id) values (15, 18);
insert into artist_artwork (artist_id, artwork_id) values (18, 30);
insert into artist_artwork (artist_id, artwork_id) values (25, 23);
insert into artist_artwork (artist_id, artwork_id) values (14, 27);
insert into artist_artwork (artist_id, artwork_id) values (22, 20);
insert into artist_artwork (artist_id, artwork_id) values (25, 32);
insert into artist_artwork (artist_id, artwork_id) values (14, 3);
insert into artist_artwork (artist_id, artwork_id) values (1, 26);
insert into artist_artwork (artist_id, artwork_id) values (13, 7);
insert into artist_artwork (artist_id, artwork_id) values (25, 6);
insert into artist_artwork (artist_id, artwork_id) values (25, 11);
insert into artist_artwork (artist_id, artwork_id) values (1, 35);
insert into artist_artwork (artist_id, artwork_id) values (12, 10);
insert into artist_artwork (artist_id, artwork_id) values (5, 22);
insert into artist_artwork (artist_id, artwork_id) values (7, 38);
insert into artist_artwork (artist_id, artwork_id) values (22, 17);
insert into artist_artwork (artist_id, artwork_id) values (7, 3);
insert into artist_artwork (artist_id, artwork_id) values (3, 28);
insert into artist_artwork (artist_id, artwork_id) values (4, 35);
insert into artist_artwork (artist_id, artwork_id) values (18, 20);
insert into artist_artwork (artist_id, artwork_id) values (10, 15);
