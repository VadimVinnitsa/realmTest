//
//  ViewController.swift
//  realmTest
//
//  Created by Admin on 04/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import RealmSwift

class Dog : Object {
    @objc dynamic var name = "gav"
    @objc dynamic var age = 10
   
}

class Cat : Object {
    @objc dynamic var name = "gav"
    @objc dynamic var age = 10
    
}




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        
        let sobaka1 = Dog()
        sobaka1.name = "1"
        let sobaka2 = Dog()
        sobaka2.name = "2"
        let sobaka3 = Dog()
        sobaka3.name = "3"
        
        let cat1 = Cat()
        cat1.name = "1"
        
        let cat2 = Cat()
        cat2.name = "2"
        
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(sobaka1)
            realm.add(sobaka2)
            realm.add(sobaka3)
            realm.add(cat1)
            realm.add(cat2)
       // realm.deleteAll()
        }
      //  print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        var array = realm.objects(Dog.self)
        
        print(array.count)
      
        
        try! realm.write {
            realm.delete(sobaka2)
        }
       
        print(array.count)
        
        
        }


}

