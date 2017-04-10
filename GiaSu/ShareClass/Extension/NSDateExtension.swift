//
//  NSDateExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 6/13/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

extension Date {
    static func isoDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:00" //2016-07-12T14:37:50.537
        return dateFormatter
    }
    
    static func isoDateFormatterWithoutTime() -> DateFormatter {
        let dateFormatter = DateFormatter()
        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'00:00:00"
        return dateFormatter
    }
    
    static func isoDateStringFromDate(_ date: Date) -> String {
        let isoDateFormatter = Date.isoDateFormatter()
        return isoDateFormatter.string(from: date)
    }
    
    static func dateStringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func stringFromDate(_ date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        return dateFormatter.string(from: date)
    }
    
    static func shortStringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.string(from: date)
    }
    
    static func dateFromStringValue(_ stringDate: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        
        return dateFormatter.date(from: stringDate)!
    }
    
    static func dateWithCustomTime(_ date: Date, format: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let stringDate = dateFormatter.string(from: date)
        return Date.dateFromStringValue(stringDate, format: format)
    }
    
    func minutesIntervalFromDate(_ date: Date) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
//        
//        var fromDate: Date?
//        var toDate: Date?
////        (calendar as NSCalendar).range(of: .day, start: fromDate as NSDate?, interval: nil, for: self)
////        (calendar as NSCalendar).range(of: .day, start: toDate as NSDate?, interval: nil, for: date)
//        
//        let difference = (calendar as NSCalendar).components(.day, from: fromDate!, to: toDate!, options: [])
//        return difference.minute!
        
        let flags = NSCalendar.Unit.day
        let components = (calendar as NSCalendar).components(flags, from: self, to: date, options: [])
        return  components.minute! + 1
        
    }
    
    func dayIntervalFromDate(_ date: Date) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current

        
        // Replace the hour (time) of both dates with 00:00
        //        let date1 = calendar.startOfDayForDate(startDate)
        //        let date2 = calendar.startOfDayForDate(startDate)
        let flags = NSCalendar.Unit.day
        let components = (calendar as NSCalendar).components(flags, from: self, to: date, options: [])
        return  components.day! + 1
        
    }
    
    func dateByAddingDayInterval(_ day: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = day
        
        let calendar = Calendar.current
        let newDate = (calendar as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options(rawValue: 0))
        return newDate!
    }
    
    static func timeIntervalFromDateTime(_ startTime: Date, to endTime: Date) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        
//        var fromDate: NSDate?
//        var toDate: NSDate?
//        calendar.rangeOfUnit(.Day, startDate: &fromDate, interval: nil, forDate: self)
//        calendar.rangeOfUnit(.Day, startDate: &toDate, interval: nil, forDate: date)
        
        let difference = (calendar as NSCalendar).components(.hour, from: startTime, to: endTime, options: [])
        return difference.hour!
    }
    
    func nextDate() -> Date {
        return self.dateByAddingDayInterval(1)
    }
    
    func previousDate() -> Date {
        return self.dateByAddingDayInterval(-1)
    }
    
    func nextTime() -> Date {
        return self.addingTimeInterval(1*60*60.0)
    }
    
    
    func previousTime() -> Date {
        return self.addingTimeInterval(-1*60*60.0)
    }
    
    static func compareDateWithoutTime(_ startDate: Date, endDate: Date) -> Bool {
       let date1 = startDate.dateWithoutTime()
        let date2 = endDate.dateWithoutTime()
        return date1.compare(date2) == ComparisonResult.orderedSame
    }
    
    func dateWithoutTime () -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString  =  dateFormatter.string(from: self)
        let date = dateFormatter.date(from: dateString)!
        
        return date

        
//        let calendate: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
//        let unitFlags: NSCalendarUnit = [.Day, .Month, .Year]
//        let component = calendate.components(unitFlags, fromDate: self)
//        return calendate.dateFromComponents(component)!
    }

    
    static func formattedStringFromDuration(_ duration: Int) -> String {
        // duration in minute
        var formattedString = String()
        let hours = duration / 60
        let minutes = duration % 60
        
        if hours > 0 {
            formattedString = "\(hours)h"
        }
        if minutes > 0 {
            formattedString = formattedString + "\(minutes)m"
        }
        
        return formattedString
    }
    
    static func formattedStringFromSeconds(_ seconds: Int) -> String {
        var formattedString = String()
        let hours = seconds / 3600
        let minutes = (seconds / 60) % 60
        
        if hours > 0 {
            formattedString = "\(hours)h"
        }
        if minutes > 0 {
            formattedString = formattedString + "\(minutes)m"
        }
        
        return formattedString
    }
    
    func year() -> Int {
        let dateComponents = (Calendar.current as NSCalendar).components([NSCalendar.Unit.year], from: self)
        return dateComponents.year!
    }
    
    func month() -> Int {
        let dateComponents = (Calendar.current as NSCalendar).components([NSCalendar.Unit.month], from: self)
        return dateComponents.month!
    }
    
    func day() -> Int {
        let dateComponents = (Calendar.current as NSCalendar).components([NSCalendar.Unit.day], from: self)
        return dateComponents.day!
    }
    
    static func daysBetweenDay(_ startDate: Date, toDate endDate: Date) -> Int {
        let calendar: Calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
//        let date1 = calendar.startOfDayForDate(startDate)
//        let date2 = calendar.startOfDayForDate(startDate)
        let flags = NSCalendar.Unit.day
        let components = (calendar as NSCalendar).components(flags, from: startDate, to: endDate, options: [])
        
      return  components.day! + 1
    }
}

extension DateFormatter {
    class func formatterWithString(_ formatString: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter
    }
}
