
--
-- Структура таблицы `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('41d196e96793');

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `car` varchar(100) NOT NULL,
  `car_plate` varchar(100) NOT NULL,
  `is_reserve` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `car`, `car_plate`, `is_reserve`) VALUES
(1, 'Kia Rio', 'o787oo50', 1),
(2, 'VW Polo', 'e887eo777', 0),
(3, 'VW Polo', 'm761oh797', 1),
(4, 'Toyota RAV4', 'h761oh797', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `sms_code` int(11) NOT NULL,
  `car` varchar(100) NOT NULL,
  `car_plate` varchar(100) NOT NULL,
  `fuel_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `trips`
--

INSERT INTO `trips` (`id`, `phone_number`, `sms_code`, `car`, `car_plate`, `fuel_level`) VALUES
(1, '+79846274627', 1420, 'Kia Rio', 'o787oo50', 76),
(2, '+79175628572', 1100, 'VW Polo', 'm761oh797', 56),
(3, '+7916552451', 1100, 'Toyota RAV4', 'm761oh797', 11);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_trips_phone_number` (`phone_number`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;


