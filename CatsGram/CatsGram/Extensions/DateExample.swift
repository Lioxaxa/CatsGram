//
//  NotificationsName.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 1.07.21.
//

import Foundation

class DateExample {
    func dateExample() {
        //Текущая дата или полученная от сервера
        let currentDate = Date()
        
        
        //Форматтер приобразующий дату в строку на основании
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
              
        
        // Протестировать форматтер
        // https://nsdateformatter.com
        
        
        // Не забывать про тайм зоны
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        // GMT
        
        //Конвертируем Date в String для вывода в UI компоненты
        let dateString = DateFormatter.shortDateFormatter().string(from: currentDate)
        //https://www.hackingwithswift.com/example-code/system/how-to-convert-dates-and-times-to-a-string-using-dateformatter
        
        print(dateString)
    }
    
    
    // Преобразование String в Date
    func stringToDate() {
        let isoDate = "2016-04-14T10:44:00+0000"

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:isoDate)
        
        print(date ?? Date())
    }
}

//Пишем свой собственный индивидуальный форматтер или несколько
extension DateFormatter {
    static func shortDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter
    }
}
