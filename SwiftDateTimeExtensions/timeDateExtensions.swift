// timeDateExtensions.swift
// Created by Axel Schlueter on 4.6.14.
//
// The MIT License (MIT)
// Copyright (c) 2014 Axel Schlueter

import Foundation


extension NSDateComponents {
  /** returns the current date plus the receiver's interval */
  var fromNow: NSDate {
    let cal = NSCalendar.currentCalendar()
    return cal.dateByAddingComponents(self, toDate: NSDate.date(), options: nil)
  }
  
  /** returns the current date minus the receiver's interval */
  var ago: NSDate {
    let cal = NSCalendar.currentCalendar()
    return cal.dateByAddingComponents(-self, toDate: NSDate.date(), options: nil)
  }
}

/** helper method to DRY the code a little, adds or subtracts two sets of date components */
func combineComponents(left: NSDateComponents,
  right: NSDateComponents,
  multiplier: Int) -> NSDateComponents
{
  let comps = NSDateComponents()
  comps.second = ((left.second != NSUndefinedDateComponent ? left.second : 0) +
                  (right.second != NSUndefinedDateComponent ? right.second : 0) * multiplier)
  comps.minute = ((left.minute != NSUndefinedDateComponent ? left.minute : 0) +
                  (right.minute != NSUndefinedDateComponent ? right.minute : 0) * multiplier)
  comps.hour = ((left.hour != NSUndefinedDateComponent ? left.hour : 0) +
                (right.hour != NSUndefinedDateComponent ? right.hour : 0) * multiplier)
  comps.day = ((left.day != NSUndefinedDateComponent ? left.day : 0) +
               (right.day != NSUndefinedDateComponent ? right.day : 0) * multiplier)
  comps.month = ((left.month != NSUndefinedDateComponent ? left.month : 0) +
                 (right.month != NSUndefinedDateComponent ? right.month : 0) * multiplier)
  comps.year = ((left.year != NSUndefinedDateComponent ? left.year : 0) +
                (right.year != NSUndefinedDateComponent ? right.year : 0) * multiplier)
  return comps
}

/** adds the two sets of date components */
@infix func +(left: NSDateComponents, right: NSDateComponents) -> NSDateComponents {
  return combineComponents(left, right, 1)
}

/** subtracts the two sets of date components */
@infix func -(left: NSDateComponents, right: NSDateComponents) -> NSDateComponents {
  return combineComponents(left, right, -1)
}

/** negates the two sets of date components */
@prefix func -(comps: NSDateComponents) -> NSDateComponents {
  let result = NSDateComponents()
  if(comps.second != NSUndefinedDateComponent) { result.second = -comps.second }
  if(comps.minute != NSUndefinedDateComponent) { result.minute = -comps.minute }
  if(comps.hour != NSUndefinedDateComponent) { result.hour = -comps.hour }
  if(comps.day != NSUndefinedDateComponent) { result.day = -comps.day }
  if(comps.month != NSUndefinedDateComponent) { result.month = -comps.month }
  if(comps.year != NSUndefinedDateComponent) { result.year = -comps.year }
  return result
}

/** functions to convert integers into various time intervals */
extension Int {
  var minutes: NSDateComponents {
    let comps = NSDateComponents()
    comps.minute = self;
    return comps
  }
  
  var hours: NSDateComponents {
    let comps = NSDateComponents()
    comps.hour = self;
    return comps
  }
  
  var days: NSDateComponents {
    let comps = NSDateComponents()
    comps.day = self;
    return comps
  }
  
  var weeks: NSDateComponents {
    let comps = NSDateComponents()
    comps.day = 7 * self;
    return comps
  }
  
  var months: NSDateComponents {
    let comps = NSDateComponents()
    comps.month = self;
    return comps
  }
  
  var years: NSDateComponents {
    let comps = NSDateComponents()
    comps.year = self;
    return comps
  }
}

/** examples on how to use the library */
func tests() {
  println("now:                   \(NSDate.date())")
  println("8 days later:          \(8.days.fromNow)")
  println("2 weeks before:        \(2.weeks.ago)")
  println("5 days, 3 month later: \((5.days + 3.months).fromNow)")
}
