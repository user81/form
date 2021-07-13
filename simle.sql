SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- База данных: `pizza-form`
--

-- --------------------------------------------------------

--
-- Структура таблицы `pizza`
--

DROP TABLE IF EXISTS `pizza`;
CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` FLOAT(11) NOT NULL
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pizza`
--

INSERT INTO `pizza` (`id`, `name`, `price`) VALUES
(1, 'Пепперони', 20),
(2, 'Деревенская', 10),
(3, 'Гавайская', 15),
(4, 'Грибная', 5);

-- --------------------------------------------------------
--
-- Структура таблицы `sauces`
--

DROP TABLE IF EXISTS `sauces`;
CREATE TABLE `sauces` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` FLOAT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sauces`
--

INSERT INTO `sauces` (`id`, `name`, `price`) VALUES
(1, 'сырный', 2),
(2, 'кисло-сладкий', 4),
(3, 'чесночный', 3),
(4, 'барбекю', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `coefficient`FLOAT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `size`
--

INSERT INTO `size` (`id`, `size`, `coefficient`) VALUES
(1, 21, 1),
(2, 26, 0.2),
(3, 31, 0.2),
(4, 45, 0.25);

-- --------------------------------------------------------

--
-- Структура таблицы `pizza-description`
--

CREATE TABLE `pizza-description` (
  `pizza_id` int(11) NOT NULL,
  `sauces_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pizza-description`
--

INSERT INTO `pizza-description` (`pizza_id`, `sauces_id`, `size_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 2, 1),
(1, 2, 2),
(1, 2, 3),
(1, 2, 4),
(1, 3, 1),
(1, 3, 2),
(1, 3, 3),
(1, 3, 4),
(1, 4, 1),
(1, 4, 2),
(1, 4, 3),
(1, 4, 4),
(2, 1, 1),
(2, 1, 2),
(2, 1, 3),
(2, 1, 4),
(2, 2, 1),
(2, 2, 2),
(2, 2, 3),
(2, 2, 4),
(2, 3, 1),
(2, 3, 2),
(2, 3, 3),
(2, 3, 4),
(2, 4, 1),
(2, 4, 2),
(2, 4, 3),
(2, 4, 4),
(3, 1, 1),
(3, 1, 2),
(3, 1, 3),
(3, 1, 4),
(3, 2, 1),
(3, 2, 2),
(3, 2, 3),
(3, 2, 4),
(3, 3, 1),
(3, 3, 2),
(3, 3, 3),
(3, 3, 4),
(3, 4, 1),
(3, 4, 2),
(3, 4, 3),
(3, 4, 4),
(4, 1, 1),
(4, 1, 2),
(4, 1, 3),
(4, 1, 4),
(4, 2, 1),
(4, 2, 2),
(4, 2, 3),
(4, 2, 4),
(4, 3, 1),
(4, 3, 2),
(4, 3, 3),
(4, 3, 4),
(4, 4, 1),
(4, 4, 2),
(4, 4, 3),
(4, 4, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sauces`
--
ALTER TABLE `sauces`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pizza-description`
--
ALTER TABLE `pizza-description`

  ADD PRIMARY KEY (`pizza_id`, `sauces_id`, `size_id`),
  ADD KEY `pizza_id` (`pizza_id`),
  ADD KEY `sauces_id` (`sauces_id`),
  ADD KEY `size_id` (`size_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sauces`
--
ALTER TABLE `sauces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `pizza-description`
--
ALTER TABLE `pizza-description`
  ADD CONSTRAINT `pizza-name` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pizza-sauces` FOREIGN KEY (`sauces_id`) REFERENCES `sauces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pizza-size` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;