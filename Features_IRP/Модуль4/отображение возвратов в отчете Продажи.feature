﻿#language: ru

@tree

Функционал: отображение возвратов в отчете Продажи

Как тестировщик> я хочу
сформировать отчет
чтобы чтобы проверить движение
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
Сценарий: отображение возвратов в отчете Продажи
*сформируем отчет
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R11C1" в течение 20 секунд
* сверим результат с макетом	
	Дано Табличный документ "Result" равен макету "макет отчета продажи"