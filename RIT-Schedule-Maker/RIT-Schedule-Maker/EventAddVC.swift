//
//  EventAddVC.swift
//  RIT-Schedule-Maker
//
//  Created by Lydia Wu on 4/16/18.
//  Copyright © 2018 RIT. All rights reserved.
//

import UIKit

class EventAddVC: UIViewController {

    var event:EventData?
    //@IBOutlet weak var eventName: UITextField!
   @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var eventName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //prepare for entries into tables
    override func prepare( for segue: UIStoryboardSegue, sender: Any?){
        let name = (eventName.text?.count)! > 0 ? eventName.text!: "No title entered"
        var dateTxt : String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        dateTxt = dateFormatter.string(from: date.date)
        event = EventData(eventName: name, date: dateTxt)
    }


}
