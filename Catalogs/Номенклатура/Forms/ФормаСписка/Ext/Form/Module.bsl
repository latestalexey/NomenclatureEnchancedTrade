﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура Номенклатура_ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УправлениеСписком();
	УправлениеФормой(ЭтотОбъект);
	
КонецПроцедуры

&НаСервере
Процедура Номенклатура_ПриЗагрузкеДанныхИзНастроекНаСервере(Настройки)
	
	УправлениеСписком();
	УправлениеФормой(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура Номенклатура_ДекорацияКорзинаНажатие(Элемент)
	
	ОткрытьКорзину();
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ДекорацияКорзинаПроверкаПеретаскивания(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ДекорацияКорзинаПеретаскивание(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ДобавитьВКорзину(ПараметрыПеретаскивания.Значение);
	
	УправлениеФормой(ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_НадписьПодобраноТоваровНажатие(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	ОткрытьКорзину();
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ОтборСкладПриИзменении(Элемент)
	
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ОтборОстаткиПриИзменении(Элемент)
	
	УстановитьЗначениеПараметраПоказыватьТолькоОстаткиСпискаНоменклатуры(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ОтборВидЦенПриИзменении(Элемент)
	
	УправлениеФормой(ЭтотОбъект);
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ОтборВидЦенОчистка(Элемент, СтандартнаяОбработка)
	
	УправлениеФормой(ЭтотОбъект);
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ЦеныОтПриИзменении(Элемент)
	
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_ЦеныДоПриИзменении(Элемент)
	
	УправлениеСписком();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Номенклатура_ДобавитьВКорзинуИзСписка(Команда)
	
	Если Элементы.СтраницыСписков.ТекущаяСтраница = Элементы.СтраницаРасширенныйПоискНоменклатура Тогда
		ТекущаяСтрока = Элементы.СписокРасширенныйПоискНоменклатура.ТекущаяСтрока;
	Иначе
		ТекущаяСтрока = Элементы.СписокСтандартныйПоискНоменклатура.ТекущаяСтрока;
	КонецЕсли;
	
	ДобавитьВКорзину(ТекущаяСтрока);
	
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_СоздатьЗаказКлиента(Команда)
	СоздатьДокумент("ЗаказКлиента");
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_СоздатьРеализацияТоваровУслуг(Команда)
	СоздатьДокумент("РеализацияТоваровУслуг");
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_СоздатьЗаказПоставщику(Команда)
	СоздатьДокумент("ЗаказПоставщику");
КонецПроцедуры

&НаКлиенте
Процедура Номенклатура_СоздатьПоступлениеТоваровУслуг(Команда)
	СоздатьДокумент("ПоступлениеТоваровУслуг");
КонецПроцедуры

#КонецОбласти

#Область Корзина

&НаКлиенте
Процедура ОткрытьКорзину()
	
	Если Корзина.Количество()>0 Тогда
		ПараметрыКорзины = ЗаписатьПодборВХранилище();
		ОткрытьКорзинуПродолжить(ПараметрыКорзины);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьКорзинуПродолжить(ПараметрыКорзины)
	
	ПередаваемыеПараметры = Новый Структура;
	ПередаваемыеПараметры.Вставить("АдресКорзиныВХранилище", ?(ЗначениеЗаполнено(ПараметрыКорзины), ПараметрыКорзины.АдресКорзиныВХранилище, Неопределено));
	ПередаваемыеПараметры.Вставить("ОтборВидЦен", ОтборВидЦен);
	ПередаваемыеПараметры.Вставить("ОтборСклад", ОтборСклад);
	
	ПередаваемыеПараметры.Вставить("УникальныйИдентификаторФормыВладельца", УникальныйИдентификатор);
	ОповещениеКорзинаЗакрытие = Новый ОписаниеОповещения("КорзинаЗакрытие",ЭтотОбъект);
	ОткрытьФорму("Обработка.ПанельИнформацииНоменклатуры.Форма.ФормаКорзина",ПередаваемыеПараметры, ЭтаФорма,,,,ОповещениеКорзинаЗакрытие,
		РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры

&НаКлиенте
Процедура КорзинаЗакрытие(ПараметрЗакрытия, Параметры) Экспорт

	Корзина.Очистить();
	
	Если ПараметрЗакрытия = Неопределено Тогда
		//Закрытие без сохранения
	ИначеЕсли ПараметрЗакрытия="ПеренестиВДокумент" Тогда
		//Закрытие без сохранения
	Иначе 
		//Закрытие с сохранением
		Для каждого стр Из ПараметрЗакрытия.Корзина Цикл
			НовСтр = Корзина.Добавить();
			ЗаполнитьЗначенияСвойств(НовСтр, стр);
		КонецЦикла;
	КонецЕсли;
	
	УправлениеФормой(ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьВКорзину(ВыбранныеСтроки)
	
	Если ТипЗнч(ВыбранныеСтроки) = Тип("Массив") Тогда
		Для каждого ВыделеннаяСтрока Из ВыбранныеСтроки Цикл
			ДобавитьСтрокуВКорзину(ВыделеннаяСтрока);
		КонецЦикла; 
	ИначеЕсли ТипЗнч(ВыбранныеСтроки) = Тип("СправочникСсылка.Номенклатура") Тогда
		ДобавитьСтрокуВКорзину(ВыбранныеСтроки);
	КонецЕсли;
	
	УправлениеФормой(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Функция ДанныеСтрокиСписка(ВыделеннаяСтрока)

	Если Элементы.СтраницыСписков.ТекущаяСтраница = Элементы.СтраницаРасширенныйПоискНоменклатура Тогда
		ДанныеСтроки = Элементы.СписокРасширенныйПоискНоменклатура.ДанныеСтроки(ВыделеннаяСтрока);
	Иначе
		ДанныеСтроки = Элементы.СписокСтандартныйПоискНоменклатура.ДанныеСтроки(ВыделеннаяСтрока);
	КонецЕсли;
	
	Возврат ДанныеСтроки;

КонецФункции

&НаКлиенте
Процедура ДобавитьСтрокуВКорзину(ВыделеннаяСтрока)

	ДанныеСтроки = ДанныеСтрокиСписка(ВыделеннаяСтрока);
	
	СтруктураВыбора = СтруктураВыбора();
	ЗаполнитьЗначенияСвойств(СтруктураВыбора, ДанныеСтроки);
	СтруктураВыбора.Номенклатура = ДанныеСтроки.Ссылка;
	СтруктураВыбора.Количество = 1;
	СтруктураВыбора.КоличествоУпаковок = 1;
	ДобавитьНоменклатуруВКорзину(СтруктураВыбора);
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьНоменклатуруВКорзину(СтруктураВыбора)
	
	СтруктураПоискаВКорзине = Новый Структура;
	СтруктураПоискаВКорзине.Вставить("Номенклатура", СтруктураВыбора.Номенклатура);
	НайденныеСтроки = Корзина.НайтиСтроки(СтруктураПоискаВКорзине);
	Если НайденныеСтроки.Количество()=0 Тогда
		СтрокаКорзины = Корзина.Добавить();
		ЗаполнитьЗначенияСвойств(СтрокаКорзины, СтруктураВыбора);
	Иначе
		СтрокаКорзины = НайденныеСтроки[0];
		СтрокаКорзины.Количество = СтрокаКорзины.Количество + СтруктураВыбора.Количество;
		СтрокаКорзины.КоличествоУпаковок = СтрокаКорзины.Количество;
		//Если цена изменилась - перезаполняем новым значением
		СтрокаКорзины.Цена = СтруктураВыбора.Цена;
	КонецЕсли;
	
	СтруктураДействий = Новый Структура;
	СтруктураДействий.Вставить("ПересчитатьСумму");
	ОбработкаТабличнойЧастиКлиент.ОбработатьСтрокуТЧ(СтрокаКорзины, СтруктураДействий, Неопределено);
	
	ПоказатьОповещениеПользователя(НСтр("ru = 'Подбор товаров'")
		,
		,
		НСтр("ru = 'Товар "+СтруктураВыбора.Номенклатура+" добавлен в корзину'"));
		
	
КонецПроцедуры

&НаКлиенте
Функция СтруктураВыбора()
	
	Возврат Новый Структура(
		"Номенклатура,
		|ЕдиницаИзмерения,
		|Цена,
		|Количество,
		|КоличествоУпаковок,
		|Услуга");
		
КонецФункции

&НаСервере
// Функция помещает результаты подбора в хранилище
//
// Возвращает структуру:
//	Структура
//		- Адрес в хранилище, куда помещена выбранная номенклатура (корзина);
//		- Уникальный идентификатор формы владельца, необходим для идентификации при обработке результатов подбора;
//
Функция ЗаписатьПодборВХранилище() 
	
	ПодобранныеТовары = Корзина.Выгрузить();
	АдресКорзиныВХранилище = ПоместитьВоВременноеХранилище(ПодобранныеТовары, УникальныйИдентификатор);
	Возврат Новый Структура("АдресКорзиныВХранилище, УникальныйИдентификаторФормыВладельца", АдресКорзиныВХранилище, УникальныйИдентификатор);
	
КонецФункции

#КонецОбласти

#Область СозданиеДокументов

&НаСервере
Функция ПараметрыСозданияДокумента()

	ДанныеЗаполнения = Новый Структура;
	ДанныеЗаполнения.Вставить("ВидЦен", ОтборВидЦен);
	ДанныеЗаполнения.Вставить("Склад", ОтборСклад);
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ЗначенияЗаполнения", ДанныеЗаполнения);
	ПараметрыФормы.Вставить("ПараметрыКорзины", ЗаписатьПодборВХранилище());
	ПараметрыФормы.Вставить("ВидЦен", ОтборВидЦен);
	ПараметрыФормы.Вставить("Склад", ОтборСклад);
	
	Возврат ПараметрыФормы;
	
КонецФункции

&НаКлиенте
Процедура СоздатьДокумент(ИмяДокумента)
	
	Документ = СтрШаблон("Документ.%1.ФормаОбъекта", ИмяДокумента);
	ПараметрыФормы = ПараметрыСозданияДокумента();
	Корзина.Очистить();
	УправлениеФормой(ЭтаФорма);
	ОписаниеОповещения = Новый ОписаниеОповещения("СоздатьДокументЗавершение", ЭтотОбъект);
	ОткрытьФорму(Документ, ПараметрыФормы,,,,,ОписаниеОповещения);

КонецПроцедуры

&НаКлиенте
Процедура СоздатьДокументЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
	Элементы.СписокРасширенныйПоискНоменклатура.Обновить();
	Элементы.СписокСтандартныйПоискНоменклатура.Обновить();
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УправлениеФормой(Форма)
	
	Элементы = Форма.Элементы;
	
	Если Форма.Корзина.Количество() = 0 Тогда
		Элементы.ГруппаСтраницыКартинки.ТекущаяСтраница = Элементы.ГруппаКорзинаПустая;
	Иначе
		Элементы.ГруппаСтраницыКартинки.ТекущаяСтраница = Элементы.ГруппаКорзинаПолная;
	КонецЕсли;
	
	Элементы.ЦеныДиапазон.Доступность = ЗначениеЗаполнено(Форма.ОтборВидЦен);
	Элементы.СписокРасширенныйПоискНоменклатураЦена.Видимость = ЗначениеЗаполнено(Форма.ОтборВидЦен);
	Элементы.СписокСтандартныйПоискНоменклатураЦена.Видимость = ЗначениеЗаполнено(Форма.ОтборВидЦен);
	
	ОбновитьНадписьПодобраноТоваров(Форма);
	
КонецПроцедуры

//Обновляет итоги подобранных товаров в форме Корзина справочника Номенклатура
&НаКлиентеНаСервереБезКонтекста
Процедура ОбновитьНадписьПодобраноТоваров(Форма)
	
	КоличествоТоваров = Форма.Корзина.Итог("Количество");
	СуммаТоваров      = Форма.Корзина.Итог("Сумма");
	
	Если Форма.Корзина.Количество()=0 Тогда
		Форма.НадписьПодобраноТоваров = НСтр("ru = 'перетащите товары в корзину'");
	ИначеЕсли ЗначениеЗаполнено(Форма.ОтборВидЦен) Тогда
		Форма.НадписьПодобраноТоваров = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			НСтр("ru = 'Подобрано: %1 на сумму %2'"),
			Форма.Корзина.Итог("Количество"),
			Формат(Форма.Корзина.Итог("Сумма"),"ЧДЦ=2; ЧН=0"));
	Иначе
		Форма.НадписьПодобраноТоваров = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			НСтр("ru = 'Подобрано: %1'"),
			Форма.Корзина.Итог("Количество")
			);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область Отборы

&НаСервереБезКонтекста
Функция ВсеСклады()

	// TODO Может нужно как то хранить это все
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	Склады.Ссылка
	|ИЗ
	|	Справочник.Склады КАК Склады
	|ГДЕ
	|	Склады.ПометкаУдаления = ЛОЖЬ";
	РезультатЗапроса = Запрос.Выполнить();
	Возврат РезультатЗапроса.Выгрузить().ВыгрузитьКолонку("Ссылка");

КонецФункции

&НаСервере
Процедура УправлениеСписком()
	
	Если ЗначениеЗаполнено(ОтборСклад) Тогда
		МассивСкладов = ОбщегоНазначенияКлиентСервер.ЗначениеВМассиве(ОтборСклад);
	Иначе
		МассивСкладов = ВсеСклады();
	КонецЕсли;
	СписокНоменклатура.Параметры.УстановитьЗначениеПараметра("ОтборСклад", МассивСкладов);
	СписокНоменклатура.Параметры.УстановитьЗначениеПараметра("ВидЦены", ОтборВидЦен);
	УстановитьЗначениеПараметраПоказыватьТолькоОстаткиСпискаНоменклатуры(ЭтаФорма);
	
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(
		СписокНоменклатура, 
		"Цена", 
		ЦенаОт, 
		(ЦенаОт <> 0) И ЗначениеЗаполнено(ОтборВидЦен), 
		ВидСравненияКомпоновкиДанных.БольшеИлиРавно);
	
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(
		СписокНоменклатура,
		"Цена2",
		ЦенаДо,
		(ЦенаДо <> 0) И ЗначениеЗаполнено(ОтборВидЦен),
		ВидСравненияКомпоновкиДанных.МеньшеИлиРавно);
		
	Элементы.СписокРасширенныйПоискНоменклатура.Обновить();
	Элементы.СписокСтандартныйПоискНоменклатура.Обновить();
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьЗначениеПараметраПоказыватьТолькоОстаткиСпискаНоменклатуры(Форма)
	
	ИспользованиеОтбора = (Форма.ОтборОстатки <> 0);
	ИспВидСравнения = ?(Форма.ОтборОстатки = 1, ВидСравненияКомпоновкиДанных.Больше, ВидСравненияКомпоновкиДанных.МеньшеИлиРавно);
	
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(
		Форма.СписокНоменклатура,
		"ВНаличии",
		0,
		ИспользованиеОтбора,
		ИспВидСравнения);
	
КонецПроцедуры

#КонецОбласти