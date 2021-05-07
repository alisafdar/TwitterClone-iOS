//
//  Date.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//
import Foundation
extension Date {
	func timeAgo() -> String {
		let calendar = Calendar.current
		let now = Date()
		let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
		let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])
		
	
		if let year = components.year, year > 0 {
			return "\(year)y"
		}
				
		if let month = components.month, month > 0 {
			return "\(month)m"
		}
		
		if let week = components.weekOfYear, week > 0 {
			return "\(week)w"
		}
		
		if let day = components.day, day > 0 {
			return "\(day)d"
		}
		
		if let hour = components.hour, hour > 0 {
			return "\(hour)h"
		}
		
		if let minute = components.minute, minute > 0 {
			return "\(minute)m"
		}
		
		return "\(components.second ?? 0)s"
	}
	
	var millisecondsSince1970:Int64 {
		return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
	}
	
	init(milliseconds:Int64) {
		self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
	}
}
