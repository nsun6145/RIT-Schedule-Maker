//
//  EventData.swift
//  
//
//  Created by Lydia Wu on 5/2/18.
//

import Foundation
import UIKit

class EventData: UIViewController{
    static let shared = EventData()
    
    //var time: String = "0:00"
    //var eventName: String = " "
    
    private init(){
        
    }
    
    func fetchEventName() -> String{
        return eventName
    }
    
    func fetchEventTime() -> String{
        return time
    }
    
}
