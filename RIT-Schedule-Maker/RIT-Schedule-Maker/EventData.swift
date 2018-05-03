//
//  EventData.swift
//  RIT-Schedule-Maker
//
//  Created by Lydia Wu on 5/2/18.
//  Copyright © 2018 RIT. All rights reserved.
//

import Foundation
import UIKit


protocol EventDataDelegate{
    func addData()
    
}

class EventData{
    
    //@IBOutlet weak var eventName: UITextField!

    
    var delegate : EventDataDelegate?
    //static let shared = EventData()
    
    //IBOutlets
    var date: String
    var eventName: String
    
    init(eventName:String, date: String){
        self.eventName = eventName
        self.date = date
    }
    
}
