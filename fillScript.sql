USE test;

DROP TABLE IF EXISTS note;

CREATE TABLE note (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(300) NOT NULL,
  done TINYINT(1) NOT NULL,
  createdDate DATETIME NOT NULL,
  PRIMARY KEY (id))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO note (name, description, done, createdDate) VALUES ('купить хлеб',
                                                                'очень важно не забыть купить хлеба',
                                                                1,
                                                                '2017-10-01 17:25:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Зелёный Мыс',
                                                                'хутор в Азовском районе Ростовской области. Население
                                                                — 128 человек (2010 год).',
                                                                0,
                                                                '2017-10-01 18:24:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Кухельмис',
                                                                'коммуна в Германии, в земле Мекленбург-Передняя
                                                                Померания. Входит в состав района Гюстров. Подчиняется
                                                                управлению Краков ам Зее.',
                                                                0,
                                                                '2017-10-02 04:23:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('прочитать книгу',
                                                                'Вундеркинд - часть 1',
                                                                1,
                                                                '2017-10-03 18:22:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('прочитать книгу',
                                                                'Вундеркинд - часть 2',
                                                                1,
                                                                '2017-10-04 18:21:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Волоснец кистистый',
                                                                'многолетнее травянистое растение; вид рода Волоснец
                                                                (Leymus) семейства Злаки (Poaceae).',
                                                                0,
                                                                '2017-10-05 18:20:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Сянино (Вологодская область)',
                                                                'Сянино — деревня в Усть-Кубинском районе Вологодской
                                                                области. Входит в состав Никольского сельского
                                                                поселения',
                                                                0,
                                                                '2017-10-06 18:19:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('сделать перестановку',
                                                                'переставить шкаф и стол',
                                                                1,
                                                                '2017-10-07 18:18:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('протестировать заметки',
                                                                'проверить удаление, добавление',
                                                                1,
                                                                '2017-10-08 18:17:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Wii Sports Resort',
                                                                'видеоигра, представляющая собой сборник из двенадцати
                                                                спортивных мини-игр, выпущенная компанией Nintendo для
                                                                собственной консоли Wii; сиквел Wii Sports.',
                                                                0,
                                                                '2017-10-09 18:16:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Геморрагическая лихорадка Эбола',
                                                                'острая вирусная высококонтагиозная болезнь. Редкое,
                                                                но крайне опасное заболевание. Вспышки эпидемии
                                                                зафиксированы в Центральной и Западной Африке',
                                                                0,
                                                                '2017-10-10 18:15:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('заправить постель',
                                                                'нужно заправить постель до утра',
                                                                1,
                                                                '2017-10-11 18:08:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('покушать',
                                                                'не забыть покушать',
                                                                1,
                                                                '2017-10-12 18:07:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('сохранить файл',
                                                                'сохранить файл с важной инфой',
                                                                0,
                                                                '2017-10-13 18:06:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Орбита (мини-футбольный клуб)',
                                                                'мини-футбольный клуб из Запорожья, бронзовый призёр
                                                                 чемпионата Украины по мини-футболу 1992 года',
                                                                0,
                                                                '2017-10-14 18:05:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('заполнить место',
                                                                'заполнить место на рабочем столе',
                                                                1,
                                                                '2017-10-15 18:04:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('выключить свет',
                                                                'выключить свет как можно скорее',
                                                                1,
                                                                '2017-10-16 18:03:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('сходить на пары',
                                                                'сходить на пары',
                                                                0,
                                                                '2017-09-20 18:02:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Дворец правосудия (Брюссель)',
                                                                'Здание государственного суда в Брюсселе. Дворец
                                                                Правосудия является крупнейшей судебной палатой
                                                                Бельгии.',
                                                                0,
                                                                '2017-09-21 18:01:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('создать папку',
                                                                'создать папку, а в ней еще одну и там уже файл',
                                                                1,
                                                                '2017-09-22 18:59:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('включить свет',
                                                                'включить свет до ночи',
                                                                1,
                                                                '2017-09-23 18:58:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Брэ́ндон Куи́нн Свире́нга',
                                                                'американский актёр. Он начал свою карьеру в 1998 году,
                                                                 сыграв роль Чарли Мёрфи в короткометражном фильме
                                                                 «Экспресс: Проход к славе».',
                                                                0,
                                                                '2017-09-20 18:57:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('ИФИА',
                                                                'Международная федерация ассоциаций изобретателей —
                                                                это некоммерческая, неправительственная организация,
                                                                основанная в Лондоне 11 июля 1968.',
                                                                0,
                                                                '2017-09-20 18:56:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('открыть окно',
                                                                'открыть окно, чтобы проветрить',
                                                                1,
                                                                '2017-09-24 18:54:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('закрыть окно',
                                                                'необходимо закрыть окно',
                                                                1,
                                                                '2017-09-26 18:53:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Кожелуг, Карел',
                                                                'чешский спортсмен, известный как теннисист,
                                                                хоккеист и футболист',
                                                                0,
                                                                '2017-09-30 18:52:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Педру I (граф Урхеля)',
                                                                'инфант Португалии, титулярный граф Урхельский,
                                                                сеньор Балеарских островов.',
                                                                0,
                                                                '2017-09-30 18:51:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('переустановить систему',
                                                                'переустановить систему и почистить',
                                                                1,
                                                                '2017-10-12 07:50:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('включить отопление',
                                                                'будет тепло',
                                                                1,
                                                                '2017-10-13 06:50:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Джулиано, Джеффри',
                                                                'Джеффри Джулиано — американский
                                                                писатель и киноактёр.',
                                                                0,
                                                                '2017-10-14 05:50:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('Песчаное (Днепропетровская область)',
                                                                'Песчаное (укр. Піщане) — село, Андреевский сельский
                                                                совет, Покровский район, Днепропетровская область,
                                                                Украина.',
                                                                0,
                                                                '2017-10-15 04:50:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('посмотреть фильм',
                                                                'выбрать фильм для просмотра',
                                                                1,
                                                                '2017-10-12 03:50:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('посмотреть футбол',
                                                                'очень важный матч',
                                                                1,
                                                                '2017-10-13 02:50:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('NGC 5750',
                                                                'NGC 5750 — галактика в
                                                                созвездии Дева.',
                                                                0,
                                                                '2017-10-13 18:50:59');

INSERT INTO note (name, description, done, createdDate) VALUES ('20 Малого Льва',
                                                                '20 Малого Льва и т.д.',
                                                                0,
                                                                '2017-10-13 01:50:59');