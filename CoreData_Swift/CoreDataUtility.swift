//
//  CoreDataUtility.swift
//  CoreData_CoreStore_Swift
//
//  Created by Leo on 1/10/17.
//  Copyright © 2017 Leo. All rights reserved.
//

import UIKit
import CoreData

let CONSTANT = ""

class CoreDataUtility: NSObject {

    static let sharedCoreDataUtility = CoreDataUtility()
    let managedContext = CoreDataManagre.sharedCoreDataManagre.persistentContainer.viewContext








    func insertRecord(stringEntityName:String, stringRecprd:String) {

        let entity = NSEntityDescription.entity(forEntityName: stringEntityName, in: self.managedContext)!

        let person = NSManagedObject(entity: entity, insertInto: self.managedContext)
        person.setValue(stringRecprd, forKeyPath: "city")

        do {
            try self.managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func deleteRecord(stringEntityName:String, stringDeleteRecord:String) {

        var people: [NSManagedObject] = []

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: stringEntityName)
        do {
            people = try self.managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        let resultData = people as! [Student_Form]

        for object in resultData {
            if object.city == stringDeleteRecord
            {
                do {
                    self.managedContext.delete(object)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }

        do {
            try self.managedContext.save()
            //            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }

    func updateRecord(stringEntityName:String, stringCompareRecord:String, stringUpdateRecprd:String)  {

        var people: [NSManagedObject] = []

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: stringEntityName)
        do {
            people = try self.managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        let resultData = people as! [Student_Form]
        for object in resultData {

            if object.city == stringCompareRecord
            {
                object.city = stringUpdateRecprd
            }
        }

        do {
            try self.managedContext.save()
            //            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }


    func fetchRecord(stringEntityName:String, stringFetchRecord:String) -> Any {

        var people: [NSManagedObject] = []
        var studentFormObject: Student_Form?

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: stringEntityName)
        do {
            people = try self.managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        let resultData = people as! [Student_Form]
        for object in resultData {
            if object.city == stringFetchRecord
            {
                object.city = stringFetchRecord
                print(object)
                studentFormObject = object
            }
        }



//        for i in 0..<people.count
//        {
//            print(people[i].value(forKey: "city")!)
//        }




        return studentFormObject
    }



    func fetchAllRecord(stringEntityName:String) -> Any {

        var people: [NSManagedObject] = []
        var arrayStudentFormObject = [Student_Form]()

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: stringEntityName)
        do {
            people = try self.managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        arrayStudentFormObject = people as! [Student_Form]

        for i in 0..<people.count
        {
            print(people[i].value(forKey: "city")!)
        }

        return arrayStudentFormObject
    }


    func deleteAllRecord(stringEntityName:String) {

        var people: [NSManagedObject] = []

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: stringEntityName)
        do {
            people = try self.managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        let resultData = people as! [Student_Form]

        for object in resultData {
            do {
                self.managedContext.delete(object)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }

        do {
            try self.managedContext.save()
            //            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }


/*
    func hitAPIhomepage(dictionaryParameters: [String:String], viewCurrent: UIView, completionHandler: @escaping (_ response:Any) -> Void) {


            print(dictionaryParameters)

            Alamofire.request(BASEURL + HOMEPAGE, method: .get, parameters: dictionaryParameters, headers: nil)

                .validate().responseJSON { response in

                    print(response.request)  // original URL request
                    print(response.response) // HTTP URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    print(response.result.error)
                    print(response.timeline)

                    switch response.result {
                    case .success(let responseValue):
                        print("Successful")

                        let responseFromAPI = responseValue as? [String:Any]
                        print(responseFromAPI)

                        if (responseFromAPI!["success"] as! Int == 1) {
                            print(responseFromAPI?["data"])
                        }
                        else {
                            print(responseFromAPI?["error"])
                            Utility_Swift.showAlertController(stringTitle: "", stringMessage: responseFromAPI?["error"] as! String)
                        }
                        
                        completionHandler(responseValue as Any)
                        
                    case .failure(let error):
                        MBProgressHUD.hideAllHUDs(for: viewCurrent, animated: true)
                        print("Error")
                        print(error)
                        print(error.localizedDescription)
                        
                        Utility_Swift.showAlertController(stringTitle: "", stringMessage: error.localizedDescription)
                        
                        completionHandler(error as Any)
                    }
            }

    }

*/









    /*
     func hitAPIhomepage(dictionaryParameters: [String:String], viewCurrent: UIView, completionHandler: @escaping (_ response:Any) -> Void) {
     if Utility_Swift.isInternetConnected(isShowPopup: true) {
     MBProgressHUD.showAdded(to: viewCurrent, animated: true)

     print(dictionaryParameters)

     Alamofire.request(BASEURL + HOMEPAGE, method: .get, parameters: dictionaryParameters, headers: nil)

     .validate().responseJSON { response in

     print(response.request)  // original URL request
     print(response.response) // HTTP URL response
     print(response.data)     // server data
     print(response.result)   // result of response serialization
     print(response.result.error)
     print(response.timeline)

     switch response.result {
     case .success(let responseValue):
     MBProgressHUD.hideAllHUDs(for: viewCurrent, animated: true)
     print("Successful")

     let responseFromAPI = responseValue as? [String:Any]
     print(responseFromAPI)

     if (responseFromAPI!["success"] as! Int == 1) {
     print(responseFromAPI?["data"])
     }
     else {
     print(responseFromAPI?["error"])
     Utility_Swift.showAlertController(stringTitle: "", stringMessage: responseFromAPI?["error"] as! String)
     }

     completionHandler(responseValue as Any)

     case .failure(let error):
     MBProgressHUD.hideAllHUDs(for: viewCurrent, animated: true)
     print("Error")
     print(error)
     print(error.localizedDescription)

     Utility_Swift.showAlertController(stringTitle: "", stringMessage: error.localizedDescription)

     completionHandler(error as Any)
     }
     }
     }
     }
     */


    /*
     func hitAPIaddToWishList(dictionaryParameters: [String:String], completionHandler: @escaping (_ response:Any) -> Void) {
     if Utility_Swift.isInternetConnected(isShowPopup: true) {
     //            MBProgressHUD.showAdded(to: viewCurrent, animated: true)

     let dictionaryHeaders = ["Auth-Token": Utility_ObjectiveC.getAuthToken() as String]

     print(dictionaryParameters)
     print(dictionaryHeaders)

     Alamofire.request(BASEURL + ADDTOWISHLIST, method: .get, parameters: dictionaryParameters, headers: dictionaryHeaders)

     .validate().responseJSON { response in

     print(response.request)  // original URL request
     print(response.response) // HTTP URL response
     print(response.data)     // server data
     print(response.result)   // result of response serialization
     print(response.result.error)
     print(response.timeline)

     switch response.result {
     case .success(let responseValue):
     //                        MBProgressHUD.hideAllHUDs(for: viewCurrent, animated: true)
     print("Successful")

     let responseFromAPI = responseValue as? [String:Any]
     print(responseFromAPI)

     if (responseFromAPI!["success"] as! Int == 1) {
     print(responseFromAPI?["data"])
     }
     else {
     print(responseFromAPI?["error"])
     Utility_Swift.showAlertController(stringTitle: "", stringMessage: responseFromAPI?["error"] as! String)
     }

     completionHandler(responseValue as Any)

     case .failure(let error):
     //                        MBProgressHUD.hideAllHUDs(for: viewCurrent, animated: true)
     print("Error")
     print(error)
     print(error.localizedDescription)

     Utility_Swift.showAlertController(stringTitle: "", stringMessage: error.localizedDescription)

     completionHandler(error as Any)
     }
     }
     }
     }
     */

/*
    APIManager.sharedAPIManager.hitAPIhomepage(dictionaryParameters: dictionaryParameters, viewCurrent: self.view, completionHandler:
    { responseValue in

    let responseFromAPI = responseValue as? [String: AnyObject]
    print(responseFromAPI)

    if(responseFromAPI != nil)
    {
    if (responseFromAPI!["success"] as! Int == 1)
    {
    print(responseFromAPI?["data"])
    print(responseFromAPI?["data"]?["bigslider"])
    }
    }
    })
    
 */



    
}
