import UIKit
//import JTAppleCalendar
import EventKit

enum MyTheme {
    case light
    case dark
}

class ViewController: UIViewController {
    
    let formatter = DateFormatter()
    var theme = MyTheme.dark
    let eventAdd = "eventAdd"
    
    @IBOutlet weak var addTable: UITableView!
    
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "backButton", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Schedule"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)
        //calenderView.backgroundColor = UIColor.green
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
        
//        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
//        self.navigationItem.rightBarButtonItem = rightBarBtn
        
        let addItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(rightBarBtnAction))
       self.navigationItem.rightBarButtonItem = addItem
 
 }
 
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc func rightBarBtnAction(sender: AnyObject) {

        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Add Classes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Event added")
        })
        let saveAction = UIAlertAction(title: "Add Events", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Classes added")
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let eventAddVC = storyBoard.instantiateViewController(withIdentifier: "EventAdd") as! EventAddVC
            let navController = UINavigationController.init(rootViewController: eventAddVC)
            self.present(navController, animated: true, completion: nil)
            //self.performSegue(withIdentifier: self.eventAdd, sender: self)
            
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
     
        present(optionMenu, animated: true, completion: nil)
        
//        if theme == .dark {
//            sender.title = "Dark"
//            theme = .light
//            Style.themeLight()
//        } else {
//            sender.title = "Light"
//            theme = .dark
//            Style.themeDark()
//        }
//        self.view.backgroundColor=Style.bgColor
//        calenderView.changeTheme()
    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()

    //FIX: Event view to be displayed
    let eventView: EventView = {
        let v = EventView()
        return v
    }()
    
//    @IBAction func backTapped(segue: UIStoryboardSegue) {
////        performSegue(withIdentifier: backToCalendar, sender: nil)
//        
//    }
//    @IBAction func backBack(_ sender: Any) {
//        self.performSegue(withIdentifier: backToMain, sender: nil)
//        
//    }
    
    
}


