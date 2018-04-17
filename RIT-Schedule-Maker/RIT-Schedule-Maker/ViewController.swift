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
        
        
//        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
//        self.navigationItem.rightBarButtonItem = rightBarBtn
        
        let addItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(rightBarBtnAction))
       self.navigationItem.rightBarButtonItem = addItem
 
 }
 
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc func rightBarBtnAction(sender: AnyObject) {
        

    
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: "Add Event", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Event added")
        })
        let saveAction = UIAlertAction(title: "Add Classes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Classes added")
            self.performSegue(withIdentifier: self.eventAdd, sender: nil)
           
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        
        // 4
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
        
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
 
    
    
}






//JTAppleCalendar

//extension ViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource{
//    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//
//    }

//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//        formatter.dateFormat = "yyyy MM dd"
//        formatter.timeZone = Calendar.current.timeZone
//        formatter.locale = Calendar.current .locale
//
//        let startDate = formatter.date(from: "2017 01 01")!
//        let endDate = formatter.date(from: "2017 12 31")!
//
//        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
//        return parameters
//    }
//
//    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "Custom Cell", for: indexPath) as! CustomCell
//        cell.dateLabel.text = cellState.text
//        print(cellState.text)
//        return cell
//    }
//
//}


