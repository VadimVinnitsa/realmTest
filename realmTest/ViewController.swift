import UIKit
import RealmSwift



final class DOG6: Object {
    @objc dynamic var name = "dfdf"
  @objc dynamic var age = 10
    
   
}



class ViewController: UIViewController {
   let realm = try! Realm()
   // var notificationToken: NotificationToken? = nil
    var notificationToken: NotificationToken? = nil
  //  let results = realm.objects(Person.self).filter("age > 5")
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
//  let results = realm.objects(DOG6.self)
       var ob = DOG6()
  
        try! realm.write {
            realm.add(ob)
        }
        
        notificationToken = ob.observe({ (change) in
            switch change {
            case .change(let properties):
                for p in properties {
                   print("changes \(p)")
                }
            case .error(let error):
                print("An error occurred: \(error)")
            case .deleted:
                print("The object was deleted.")
            }
        })
        
//        notificationToken = results.observe { [weak self] (changes: RealmCollectionChange) in
//
//            switch changes {
//
//            case .initial:
//                // Results are now populated and can be accessed without blocking the UI
//                print("initial")
//            case .update(_, let deletions, let insertions, let modifications):
//                print("deletions \(deletions)")
//                print("insertions \(insertions)")
//                print("modifications \(modifications)")
//                // Query results have changed, so apply them to the UITableView
//
//            case .error(let error):
//                // An error occurred while opening the Realm file on the background worker thread
//                fatalError("\(error)")
//            }
//        }
        
        
        let dog1 = DOG6(value: ["name":"sirco","age":20])
        let dog2 = DOG6(value: ["asdf",21])

        try! realm.write {
//            for dog in realm.objects(DOG.self).filter("age == 10") {
//                person.age += 1
//            }
//            realm.add(dog1)
//            realm.add(dog2)
            
            
            for dog in realm.objects(DOG6.self) {
                dog.age += 1
            }
            
            let result = realm.objects(DOG6.self).last
            realm.delete(result!)
         //   realm.delete(dog1)
            
            
        }
        
      
        
  
      //  print(Realm.Configuration.defaultConfiguration.fileURL)
   
        
        
   
        }
    
 


}

