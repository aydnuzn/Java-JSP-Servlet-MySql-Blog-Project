-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Ağu 2021, 05:21:48
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`aid`, `name`, `email`, `password`) VALUES
(1, 'Aydin Uzun', 'aydin@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'Ali Bilmem', 'ali@mail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blogpost`
--

CREATE TABLE `blogpost` (
  `bid` int(11) NOT NULL,
  `fk_aid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `title_detail` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `blogpost`
--

INSERT INTO `blogpost` (`bid`, `fk_aid`, `title`, `title_detail`, `content`, `date_time`) VALUES
(1, 1, 'APOLLO 11', 'Onn the other hand, we denounce with righteous indignation and di', '<p><strong>Apoll</strong><img alt=\"\" src=\"https://www.bilimseldunya.com/wp-content/uploads/2019/09/Apollo-11-Dunyaya-Donus.jpg\" style=\"float:right; height:200px; width:400px\" /><strong>o 11</strong> was the spaceflight that landed the first humans, Americans <a href=\"http://en.wikipedia.org/wiki/Neil_Armstrong\">Neil Armstrong</a> and <a href=\"http://en.wikipedia.org/wiki/Buzz_Aldrin\">Buzz Aldrin</a>, on the Moon on July 20, 1969, at 20:18 UTC. Armstrong became the first to step onto the lunar surface 6 hours later on July 21 at 02:56 UTC.</p>\r\n\r\n<h2 style=\"font-style:italic;\">Armstrong spent about <s>three and a half</s> two and a half hours outside the spacecraft, Aldrin slightly less; and together they collected 47.5 pounds (21.5&nbsp;kg) of lunar material for return to Earth. A third member of the mission, <a href=\"http://en.wikipedia.org/wiki/Michael_Collins_(astronaut)\">Michael Collins</a>, piloted the <a href=\"http://en.wikipedia.org/wiki/Apollo_Command/Service_Module\">command</a> spacecraft alone in lunar orbit until Armstrong and Aldrin returned to it for the trip back to Earth. Together they collected 47.5 pounds (21.5&nbsp;kg) of lunar material for return to Earth. A third member of the mission, <a href=\"http://en.wikipedia.org/wiki/Michael_Collins_(astronaut)\">Michael Collins</a>, piloted the <a href=\"http://en.wikipedia.org/wiki/Apollo_Command/Service_Module\">command</a> spacecraft alone in lunar orbit until Armstrong and Aldrin returned to it for the trip back to Earth.</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<h2>Broadcasting and <em>quotes</em> <a id=\"quotes\" name=\"quotes\"></a></h2>\r\n\r\n<p>Broadcast on live TV to a world-wide audience, Armstrong stepped onto the lunar surface and described the event as:</p>\r\n\r\n<blockquote>\r\n<p>One small step for [a] man, one giant leap for mankind.</p>\r\n</blockquote>\r\n\r\n<p>Apollo 11 effectively ended the <a href=\"http://en.wikipedia.org/wiki/Space_Race\">Space Race</a> and fulfilled a national goal proposed in 1961 by the late U.S. President <a href=\"http://en.wikipedia.org/wiki/John_F._Kennedy\">John F. Kennedy</a> in a speech before the United States Congress:</p>\r\n\r\n<blockquote>\r\n<p>[...] before this decade is out, of landing a man on the Moon and returning him safely to the Earth.</p>\r\n</blockquote>\r\n\r\n<h2>Technical details <a id=\"tech-details\" name=\"tech-details\"></a></h2>\r\n\r\n<table align=\"right\" border=\"1\" cellpadding=\"5\" cellspacing=\"0\">\r\n	<caption><strong>Mission crew</strong></caption>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">Position</th>\r\n			<th scope=\"col\">Astronaut</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Commander</td>\r\n			<td>Neil A. Armstrong</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Command Module Pilot</td>\r\n			<td>Michael Collins</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lunar Module Pilot</td>\r\n			<td>Edwin &quot;Buzz&quot; E. Aldrin, Jr.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Launched by a <strong>Saturn V</strong> rocket from <a href=\"http://en.wikipedia.org/wiki/Kennedy_Space_Center\">Kennedy Space Center</a> in Merritt Island, Florida on July 16, Apollo 11 was the fifth manned mission of <a href=\"http://en.wikipedia.org/wiki/NASA\">NASA</a>&#39;s Apollo program. The Apollo spacecraft had three parts:</p>\r\n\r\n<ol>\r\n	<li><strong>Command Module</strong> with a cabin for the three astronauts which was the only part which landed back on Earth</li>\r\n	<li><strong>Service Module</strong> which supported the Command Module with propulsion, electrical power, oxygen and water</li>\r\n	<li><strong>Lunar Module</strong> for landing on the Moon.</li>\r\n</ol>\r\n\r\n<p>After being sent to the Moon by the Saturn V&#39;s upper stage, the astronauts separated the spacecraft from it and travelled for three days until they entered into lunar orbit. Armstrong and Aldrin then moved into the Lunar Module and landed in the <a href=\"http://en.wikipedia.org/wiki/Mare_Tranquillitatis\">Sea of Tranquility</a>. They stayed a total of about 21 and a half hours on the lunar surface. After lifting off in the upper part of the Lunar Module and rejoining Collins in the Command Module, they returned to Earth and landed in the <a href=\"http://en.wikipedia.org/wiki/Pacific_Ocean\">Pacific Ocean</a> on July 24.</p>\r\n\r\n<hr />\r\n<p><small>Source: <a href=\"http://en.wikipedia.org/wiki/Apollo_11\">Wikipedia.org</a></small></p>\r\n', '2021-08-12'),
(6, 1, 'loves or pursues', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2021-08-12'),
(9, 1, 'Ut sit amet diam', 'Maecenas pharetra ultricies felis, eget mattis metus. Praesent eget ante ', 'Ut sit amet diam et massa finibus feugiat ac ac sem. Maecenas pharetra ultricies felis, eget mattis metus. Praesent eget ante dapibus, imperdiet nulla vitae, varius metus. Vivamus eleifend sed nisi sit amet ornare. Sed euismod leo tristique massa auctor, at tincidunt metus laoreet. Nulla id dui et mi consectetur fermentum sit amet a mauris. Vestibulum efficitur egestas mattis. Cras aliquam velit nulla, elementum porta tellus blandit ut. Donec mauris ipsum, iaculis quis turpis quis, fringilla feugiat nibh.', '2021-08-12'),
(10, 2, 'Cras at leo a magna viverra', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '<h3>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sectionsContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sectionsContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sectionsContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sectionsContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections</h3>\r\n\r\n<h2>1.10.32 and 1.10.33 of</h2>\r\n', '2021-08-12'),
(11, 1, 'Aenean finibus fermentum', 'In malesuada convallis dui, ut lobortis nunc eleifend nec. Morbi ullamcorper sapien urna, non feugiat odio sollicitudin in', 'Aenean finibus fermentum ornare. In malesuada convallis dui, ut lobortis nunc eleifend nec. Morbi ullamcorper sapien urna, non feugiat odio sollicitudin in. Duis efficitur tellus sit amet rutrum consequat. Sed auctor, arcu vel luctus convallis, tortor mi lobortis nisi, a finibus nulla neque vel tellus. Integer sit amet massa vestibulum, scelerisque justo eget, tincidunt mauris. Nunc pellentesque dui vel nunc suscipit, id euismod libero dignissim. Mauris consectetur id nulla et vestibulum. Aenean massa tellus, mollis sit amet orci ut, fringilla aliquet tortor. Suspendisse potenti. Suspendisse potenti.', '2021-08-12'),
(13, 1, '1', '12', '<p><s>123422</s></p>\r\n', '2021-08-12'),
(14, 1, 'Modern Müzik', 'Kendini yenilemekte olan modern müzik yapılarından bazılarıda burada belirtillmektedir.', '<h2><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;işlemlere <s>devam</s></strong></h2>\r\n\r\n<p>Son zamanlarda yapılan araştırmalara g&ouml;re şladslaşlsds&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>adlaslş</td>\r\n			<td>aşlsşla</td>\r\n		</tr>\r\n		<tr>\r\n			<td>asşl</td>\r\n			<td>aşl</td>\r\n		</tr>\r\n		<tr>\r\n			<td>aşl</td>\r\n			<td>şl</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', '2021-08-12'),
(15, 1, '3', '123', '123123', '2021-08-12'),
(16, 1, '4', '123', '123123', '2021-08-12'),
(17, 1, '5', '123', '1234123', '2021-08-12'),
(19, 1, '7', 'qqwee', 'sdaas', '2021-08-12'),
(20, 1, 'Lorem ipsum dolor sit amet, consectetur', 'Lorem ipsum dolor sit amet consectetur adialsdölasödlsamdşlasdşlmsaşlkms şalsdmşlksa şlkamds  adşlmsadlk alksm dşlksam d aksdkmsalk alksdmlk a kmalkm dlkam dlfö dfö  afoolpfa  adao apop', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:400px\" summary=\"devam\">\r\n	<caption>Tablo</caption>\r\n	<tbody>\r\n		<tr>\r\n			<td>sallama</td>\r\n			<td>Lorem ipsum sit amet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Nihil aspernatur</td>\r\n			<td>Iusta illum quis, facere</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Nihil aspernaturaddsssss</td>\r\n			<td>Iusta illum quis, facere</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<blockquote>\r\n<p><img alt=\"gitar\" src=\"https://www.dolunaymuzik.com/resimler/urunler/200x200/2_klasik-gitar-simge-tam-boy-4-4-resim-7180.jpg\" style=\"border-style:solid; border-width:4px; float:left; height:40px; margin:2px 5px; width:40px\" />Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil, aspernatur ipsam. Fugiat libero beatae numquam veniam consectetur explicabo, iure natus quis ratione nesciunt porro omnis, doloribus inventore distinctio ad dolor. Odio deleniti velit recusandae fuga fugiat quis! Necessitatibus laudantium officia quisquam obcaecati esse modi impedit cum, neque minus fuga, beatae eius non magni saepe quas est maxime! Harum, dolore non? Cupiditate, ab voluptatem accusantium velit suscipit sapiente sit possimus nulla ea, totam autem nisi dignissimos fugit, reprehenderit tenetur beatae atque fugiat laboriosam eos. Quis, ipsa! Ad reiciendis aut explicabo fugit. Sit facere nesciunt recusandae eos ab asperiores ad eveniet fugiat, deleniti&nbsp; &nbsp; &nbsp; &nbsp;necessitatibus ullam distinctio. Unde, at. Iusto illum quis, facere nisi reiciendis pariatur officia blanditiis quae cumque optio soluta consequatur. Provident enim omnis beatae ipsa asperiores ab! Velit aliquam labore consequatur unde ratione voluptates obcaecati enim iste? Incidunt officia, voluptatem consequatur amet rerum ullam ad suscipit alias, a soluta provident. Accusamus asperiores architecto similique iure cum dignissimos laborum voluptate. Quae provident officia debitis illum quia, velit quisquam laudantium possimus tempora ut, perferendis corrupti est adipisci! Soluta nesciunt fuga laborum atque! Laborum at, accusamus sed ipsa voluptatibus neque atque repellat sint consectetur, eum adipisci voluptatum unde necessitatibus. Perspiciatis dolore voluptas aliquid quasi hic pariatur, sint minus ratione commodi quia totam velit. Accusantium adipisci asperiores similique eum optio at hic perferendis. Mollitia libero ipsum ipsa aspernatur dolorum, omnis fugiat. Impedit voluptatum veritatis, dolorem accusamus veniam quam quo voluptate eaque molestiae sapiente sit! In officia veniam porro? Explicabo deserunt repellendus cupiditate! Culpa dolorum veniam, vitae deleniti explicabo non dolor ex earum suscipit ducimus aperiam voluptatem itaque magnam nesciunt? Nulla quasi culpa ab eum. Sint facilis cumque cum magnam voluptatem. Dolorem perspiciatis deserunt molestiae, animi id similique ratione at expedita quam quisquam, pariatur nihil sit esse nostrum aut, autem alias quia. Et, dolorem esse. Laboriosam adipisci officiis fugiat incidunt ullam optio ut nesciunt quam ipsa. Aliquam, cum ea eveniet facilis nulla neque eum dignissimos similique temporibus expedita ad quaerat tempora animi et quo perferendis. Odit eum dicta molestiae doloremque consequuntur eius quaerat nam voluptatibus ipsum quas nobis dolor harum doloribus inventore et, est impedit exercitationem quasi hic tenetur dolorem quis obcaecati iusto! Enim, earum. Sequi debitis delectus quibusdam vitae numquam soluta illum, vero unde quod fugit quisquam fuga laboriosam a! Impedit cumque, ab hic recusandae sed pariatur asperiores itaque iste, perferendis harum, debitis aperiam. Cumque nostrum repellendus natus, nisi, esse dicta voluptates vero eligendi eum necessitatibus enim velit quis repellat maiores temporibus cum, voluptate exercitationem. Officia perferendis consectetur natus. Quod mollitia eveniet blanditiis necessitatibus. Distinctio ad tenetur dolore soluta fugit, ipsam dignissimos minus, possimus maxime culpa quod iste ipsa, quibusdam corrupti voluptates velit adipisci consequatur! Iure tempore quis dolorum esse libero, fugiat quo tenetur. Dicta assumenda officia necessitatibus minus nisi eveniet distinctio sit suscipit nemo maiores quasi eligendi adipisci repudiandae iusto, qui a quo hic facere. Necessitatibus rerum expedita reiciendis natus saepe laboriosam optio. Ad, quo hic deserunt aperiam porro maxime ullam, esse tempora beatae tempore veritatis. Aspernatur, aliquam! Minus accusamus culpa dolores illum, possimus dicta quibusdam itaque, nam repellat architecto esse minima aspernatur! Quidem dicta odit officiis sit neque quis modi illum optio? Modi maiores tenetur, architecto repellendus aut perferendis. Illum ut, non deleniti id cupiditate perspiciatis quos rem cum dolorem hic laborum! Dolores cupiditate, ipsam, facilis soluta accusamus praesentium in nisi delectus reprehenderit illum hic dolor, nemo officia nulla repellat aut autem. Provident, dolores debitis enim omnis aliquid quam voluptates iusto cumque? Ab nemo, tempora debitis tempore illum reiciendis eveniet velit adipisci aspernatur laboriosam, itaque aperiam, magnam corrupti nisi. Sapiente, recusandae, ratione optio repellat libero voluptatibus laborum, officia provident sit ipsa ipsam.</p>\r\n</blockquote>\r\n', '2021-08-12'),
(21, 1, 'İçerik Kısmı', 'İçerik Kısmını Yap', '<p>Hakkımızda</p>\r\n\r\n<p><img alt=\"bolge\" src=\"../img/region.png\" style=\"width:40px\" /></p>\r\n\r\n<p>B&ouml;lgemiz</p>\r\n\r\n<p>İstanbul/Avrupa</p>\r\n\r\n<p><img alt=\"bolge\" src=\"../img/yearfoundation.png\" style=\"width:80px\" /></p>\r\n\r\n<p>Kuruluş Tarihi</p>\r\n\r\n<p>2012</p>\r\n\r\n<p><img alt=\"bolge\" src=\"../img/team.png\" style=\"width:80px\" /></p>\r\n\r\n<p>&Ccedil;alışan Sayısı</p>\r\n\r\n<p>25</p>\r\n\r\n<p><img alt=\"bolge\" src=\"../img/phone.png\" style=\"width:80px\" /></p>\r\n\r\n<p>Telefon</p>\r\n\r\n<p>+6499284992</p>\r\n\r\n<h3>Tarihimiz</h3>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime ut esse iure! Quo asperiores natus eius? Consequuntur dignissimos veniam exercitationem ipsa quaerat cumque alias inventore obcaecati, ab fuga tenetur ipsam. Eveniet quaerat adipisci, accusamus veniam, qui animi nesciunt ipsum ratione laboriosam tenetur, quae aliquid asperiores maiores delectus est officiis autem facere sit similique temporibus tempore tempora pariatur? Aliquid, unde nostrum! Ad omnis voluptas, atque corrupti perspiciatis unde adipisci assumenda quae ipsam recusandae deserunt officia dolore ab non dolor eveniet quis, velit fuga? Voluptas eligendi sint quibusdam inventore provident omnis dicta! Ipsa non assumenda, ea illum quasi delectus, enim natus ducimus cum voluptate fugit, aperiam nam sit reiciendis veniam iste animi commodi. Ad harum tenetur sunt impedit labore, at et sed? Harum autem optio corrupti similique! Repellendus doloremque ab qui ipsum quo quisquam excepturi pariatur facere at temporibus eum sapiente consequatur quae laboriosam ad labore, laborum enim ullam laudantium nesciunt autem. Itaque earum a nulla nam corrupti vitae beatae esse molestiae neque nostrum, cupiditate voluptas, illum libero odio, deleniti tenetur modi. Repudiandae hic velit, rerum saepe repellendus dolore porro quae aliquam! Excepturi, animi! Quia quam quidem omnis incidunt asperiores aut quaerat sapiveritatis consectetur tempora eos facilis amet ab a sapiente, labore alias unde rerum voluptatibus voluptate molestias commodi placeat dolorem eius facere in. Nostrum molestias deserunt nulla possimus? Dicta quos ullam nemo ipsum excepturi explicabo ut. Maxime magni, omnis pariatur expedita cum ab quibusdam asperiores molestiae veritatis nesciunt iusto distinctio sequi, sint rerum quos beatae suscipit. Assumenda, explicabo! Laboriosam distinctio incidunt sapiente reiciendis officia facilis accusantium vero adipisci animi cum voluptas magnam officiis quisquam tenetur ad saepe, harum cumque eaque eos illum quidem commodi perspiciatis. Nemo, exercitationem beatae! Aperiam quos harum veritatis incidunt maxime voluptates corrupti deserunt, eum amet repellat doloribus delectus sit sapiente quasi tempore provident aliquid, architecto dolor, non expedita distinctio ea laboriosam facere!</p>\r\n\r\n<h3>Hedefimiz</h3>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime ut esse iure! Quo asperiores natus eius? Consequuntur dignissimos veniam exercitationem ipsa quaerat cumque alias inventore obcaecati, ab fuga tenetur ipsam. Eveniet quaerat adipisci, ac expedita cum ab quibusdam asperiores molestiae veritatis nesciunt iusto distinctio sequi, sint rerum quos beatae suscipit. Assumenda, explicabo! Laboriosam distinctio incidunt sapiente reiciendis officia facilis accusantium vero adipisci animi cum voluptas magnam officiis quisquam tenetur ad saepe, harum cumque eaque eos illum quidem commodi perspiciatis. Nemo, exercitationem beatae! Aperiam quos harum veritatis incidunt maxime voluptates corrupti deserunt, eum amet repellat doloribus delectus sit sapiente quasi tempore provident aliquid, architecto dolor, non expedita distinctio ea laboriosam facere!</p>\r\n\r\n<h3>ABOUT US</h3>\r\n\r\n<p>Music strings of the highest quality &ndash; this is both the incentive and obligation of Thomastik-Infeld. Based in the heart of Vienna, we have been developing and producing strings with the vastest range of tone colors since 1919, for bowed, plucked and world music instruments.</p>\r\n\r\n<h3>CONTACT</h3>\r\n\r\n<p>Lorem ipsum dolor sit<br />\r\nLorem, ipsum<br />\r\nLorem, ipsum<br />\r\n<br />\r\nTel: <a href=\"tel:+6499284992\">+6499284992</a></p>\r\n\r\n<p>&copy; Copyright 2021 M&uuml;ziksell M&uuml;zik Market Tic. ve San Ltd. Şti</p>\r\n', '2021-08-12'),
(22, 2, '1', '1', '1', '2021-08-12'),
(23, 2, '2', '2', '2', '2021-08-12'),
(24, 2, '3', '3', '3', '2021-08-12'),
(25, 2, '4', '4', '4', '2021-08-12'),
(26, 2, '5', '5', '5', '2021-08-12'),
(27, 2, '6', '6', '<p>6dsa</p>\r\n', '2021-08-13'),
(29, 1, '8', '8', '<p>9</p>\r\n', '2021-08-12');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `message`
--

CREATE TABLE `message` (
  `mid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `message`
--

INSERT INTO `message` (`mid`, `name`, `email`, `subject`, `content`) VALUES
(1, 'Deneme Denemelik', 'deneme@mail.com', 'Denemel', 'Denemelere Message Kısmı devam ediyor'),
(2, 'aydin', 'aydin@mail.com', 'Deneme', 'adsadsda'),
(3, 'aydin', 'aydin@gmail.com', 'Deneme', 'adadss'),
(4, 'aydin', 'aydin@mail.com', 'Deneme', 'asdsaads'),
(5, 'aydin', 'musicwdmail@gmail.com', 'asd', 'adssdasda'),
(6, 'aydin', 'aydin@mail.com', 'Deneme', 'mesaj gönderildi mi kontrol'),
(8, 'Aydın Uzun', 'uzunx160@gmail.com', 'Yönetici ile İletişim', 'Merhabalar sitenizin alt kısmında yer alan telefon numarasına ulaşmaya çalıştığımda böyle bir  mevcut olamadığını görüyorum. Kontrol sağlayabilirseniz sevinirim.\r\nİyi günler'),
(11, 'Ali Bilmem', 'uzun.aydinn@gmail.com', 'Yönetim Kadrosu', 'Merhabalar, yönetim kadrosu hakkında bilgi almak için sizinle iletişime geçmek istiyorum'),
(12, 'Kadircan Yalnız', 'kadircan@mail.com', 'Sitedeki Güvenlik Kısmı', 'Merhabalar Sayın Yöneticiler sizlere sorum olacaktı...'),
(13, 'Kadircan Yalnız', 'kadircan@mail.com', 'Yönetici ile İletişim', 'Merhabalar sayın yöneticiler....'),
(14, 'Bak', 'ali@mail.com', 'Yönetici ile İletişim', 'ads'),
(15, 'Denemelere Devaö', 'devam@gmail.com', 'Deneme yapıyorum', 'hadi bakalım'),
(16, 'Aydın Uzun', 'sallamaMail@gmail.com', 'Mail Yollama İşlemleri', 'Mail yollama işlemleri için denemeler yapılıyor'),
(17, 'Aydın Uzun', 'sallamaMail@mail.com', 'Site Hakkında Bilgi', 'Merhabalar Siteniz hakkında bilgi almak istiyorum. Bu sebeple sizinle iletişime geçmek istedim..');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Tablo için indeksler `blogpost`
--
ALTER TABLE `blogpost`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `fk_aid` (`fk_aid`);

--
-- Tablo için indeksler `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `blogpost`
--
ALTER TABLE `blogpost`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Tablo için AUTO_INCREMENT değeri `message`
--
ALTER TABLE `message`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `blogpost`
--
ALTER TABLE `blogpost`
  ADD CONSTRAINT `fk_aid` FOREIGN KEY (`fk_aid`) REFERENCES `admin` (`aid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
