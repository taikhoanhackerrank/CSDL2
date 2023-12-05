

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
--  `hm-sneakers`
--

-- --------------------------------------------------------


CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL,
  `user` varchar(20) CHARACTER SET latin1 NOT NULL,
  `sneaker_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `size` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `price` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  `sneakers` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `comments` (`id`, `user`, `comment`, `sneakers`) VALUES
(55, 'Hoa Mai', 'These sneakers are perfect for running sports, they are comfortable and light. ', 'Nike Pegasus');

-- --------------------------------------------------------



CREATE TABLE `general_purchases` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `sneaker_name` varchar(100) NOT NULL,
  `size` int(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `general_purchases` (`id`, `user`, `sneaker_name`, `size`, `color`, `img`, `price`, `date`) VALUES
(26, 'HoaMai', 'Adidas Superstar', 38, 'blanco', 'adidas superstar', 76, '2022-12-15'),
(27, 'HoaMai', 'Nike Air Force', 38, 'blanco', 'nike air force', 165, '2022-12-15');

-- --------------------------------------------------------
file


CREATE TABLE `users` (
  `user` varchar(20) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `users` (`user`, `mail`, `password`, `street`, `city`) VALUES
('Hoa Mai', 'hoamai1509@gmail.com', '1', 'TranCung', 'HaNoi');



CREATE TABLE `sneakers` (
  `sneaker_name` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `file` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `sneakers` (`sneaker_name`, `descripcion`, `brand`, `price`, `file`) VALUES
('Adidas originals swi', 'Swift is a casual racing style created for everyday wear.', 'adidas', 145, 'adidas originals swift'),
('Adidas Superstar', 'If you value comfort and simple style, this proposal from the adidas brand is for you.', 'adidas', 76, 'adidas superstar'),
('Asics resolution', 'The sneakers favor an agile pace with a feeling of adhesion to the field.', 'asics', 135, 'asics resolution'),
('Asics tiger', 'Sturdy construction and classic styling ensure you look dynamic and comfortable.', 'asics', 70, 'asics tiger'),
('Converse all start', 'Versatile, fashionable, and they stay better every time you wear them.', 'converse', 65, 'converse all start'),
('Converse Taylor ', 'Versatile, fashionable, and they stay better every time you wear them.', 'converse', 92, 'converse taylor'),
('Nike Air Force', 'A sneaker version that combines classic style and modern details.', 'nike', 165, 'nike air force'),
('Nike Pegasus', 'It is characterized by combining cushioning with reactivity and energy return.', 'nike', 118, 'nike1');


ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_shopping_cart_user` (`user`),
  ADD KEY `FK1_shopping_cart_zapatilla` (`sneaker_name`);


ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_user_comment` (`user`),
  ADD KEY `FK2_zapatilla_comment` (`sneakers`);


ALTER TABLE `general_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_user` (`user`),
  ADD KEY `FK2_sneakers` (`sneaker_name`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`user`);


ALTER TABLE `sneakers`
  ADD PRIMARY KEY (`sneaker_name`);


ALTER TABLE `shopping_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;


ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

ALTER TABLE `general_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;


ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `FK1_shopping_cart_user` FOREIGN KEY (`user`) REFERENCES `users` (`user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK1_shopping_cart_zapatilla` FOREIGN KEY (`sneaker_name`) REFERENCES `sneakers` (`sneaker_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `comments`
  ADD CONSTRAINT `FK1_user_comment` FOREIGN KEY (`user`) REFERENCES `users` (`user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK2_zapatilla_comment` FOREIGN KEY (`sneakers`) REFERENCES `sneakers` (`sneaker_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
--
ALTER TABLE `general_purchases`
  ADD CONSTRAINT `FK1_user` FOREIGN KEY (`user`) REFERENCES `users` (`user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK2_sneakers` FOREIGN KEY (`sneaker_name`) REFERENCES `sneakers` (`sneaker_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

