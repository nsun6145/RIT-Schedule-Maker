
import UIKit
//import JTAppleCalendar
import EventKit

enum MyTheme {
    case light
    case dark
}

//All Event Data
//[year:[month:[day:[Events]]]]
struct EventStore{
    var years = [2018: [
        1: [        //Month
            1:[   //Day
                //Event data list
            ]
        ]
        ]
    ]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let events11 = "events"
    
    let formatter = DateFormatter()
    var theme = MyTheme.dark
    let eventAdd = "eventAdd"
    
    //event table
    @IBOutlet weak var eventTable: UITableView!
    
    //delegateSource/Events
    var events : [EventData] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: events11, for: indexPath)
        //cell.textLabel?.text = events1[indexPath.row]
        let event = events[indexPath.row]
        cell.textLabel?.text = event.eventName + "(" + event.date + ")"
        return cell
    }
    
    //Adds event to table when pressed (Event entry screen)
    @IBAction func addEventButton(segue:UIStoryboardSegue){
        if let addEventVC = segue.source as? EventAddVC{
            if let event = addEventVC.event{
                events.insert(event, at: 0)
                let indexPath: IndexPath = IndexPath(row: 0, section: 0)
                eventTable.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Schedule"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)

        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
        let addItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(rightBarBtnAction))
       self.navigationItem.rightBarButtonItem = addItem
 
 }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    //Pertains to upper button and action sheet
    @objc func rightBarBtnAction(sender: AnyObject) {

        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let saveAction = UIAlertAction(title: "Add Events", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let eventAddVC = storyBoard.instantiateViewController(withIdentifier: "EventAdd") as! EventAddVC
            let navController = UINavigationController.init(rootViewController: eventAddVC)
            self.present(navController, animated: true, completion: nil)
            
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
     
        present(optionMenu, animated: true, completion: nil)
    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()

}


