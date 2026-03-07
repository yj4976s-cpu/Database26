create table item_images(
id int auto_increment primary key,
item_id int not null,
image_path varchar(255) not null, -- 이미지 저장 경로 또는 url
is_main boolean default False, -- 대표 이미지 여부
created_at datetime default current_timestamp,

foreign key(item_id)
references items(id) on delete cascade
);