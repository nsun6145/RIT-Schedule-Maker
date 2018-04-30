//
//  EventData.swift
//  RIT-Schedule-Maker
//
//  Created by Student on 4/29/18.
//  Copyright © 2018 RIT. All rights reserved.
//

import Foundation

class EventData{
    static let shared = EventData()
    
    var time: String = "0:00"
    var eventName: String = " "
    
    private init(){
        
    }
    
    func fetchEventName() -> String{
        return eventName
    }
    
    func fetchEventTime() -> String{
        return time
    }
    
}

