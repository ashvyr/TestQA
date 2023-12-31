﻿#language: ru

@tree

Функционал: создать 10 элементов справочника Номенклатура

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: создать 10 элементов справочника Номенклатура
И Я запоминаю значение выражения '0' в переменную "Кол"
И я делаю 10 раз
	И Я запоминаю значение выражения '$Кол$ + 1' в переменную "Кол"
	И Я запоминаю значение выражения '"Номенклатура" + $Кол$' в переменную "Наименование"
	И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'Description_ru' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '$Наименование$' |