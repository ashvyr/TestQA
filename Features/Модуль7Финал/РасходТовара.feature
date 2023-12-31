﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание документа продажи, проведение документа, движение по регистрам и печать документа

*Создание документа продажи
	И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	Тогда открылось окно 'Продажа товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Обувь"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2,00'
	И я нажимаю на кнопку с именем 'ФормаПровести'

*Провереп движение по регистру товарных запасов
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Товар'       | 'Склад'               | 'Количество' |
		| '1'            | 'Sony К3456P' | 'Малый' | '1,00'       |

*Проверка движения по регистру взаиморасчетов с контрагентами
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Контрагент'                | 'Сумма' | 'Валюта' |
		| '1'            | 'Магазин "Обувь"' | '2,00'  | ''       |
	
*Проверка движения по регистру продаж
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Покупатель'  	 | 'Товар'       | 'Количество' | 'Сумма' |
		| '1'            | 'Магазин "Обувь"' | 'Sony К3456P' | '1,00'       | '2,00'  |

*Печать документа из расходной накладной
	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда табличный документ "SpreadsheetDocument" равен:
		| 'Расход товара' | ''                          | ''           | ''      |
		| ''              | ''                          | ''           | ''      |
		| 'Номер'         | '*'                 | ''           | ''      |
		| 'Дата'          | '*'       | ''           | ''      |
		| 'Покупатель'    | 'Магазин "Обувь"' | ''           | ''      |
		| 'Склад'         | 'Малый'				       | ''           | ''      |
		| 'Сумма'         | '2 рубля (Два рубля)'      | ''           | ''      |
		| 'Вес'           | ''                          | ''           | ''      |
		| ''              | ''                          | ''           | ''      |
		| 'Товар'         | 'Цена'                      | 'Количество' | 'Сумма' |
		| 'Sony К3456P'   | '2'                         | '1'          | '2'     |