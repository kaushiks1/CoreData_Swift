//
//  ViewController.swift
//  CoreData_Swift
//
//  Created by Leo on 1/11/17.
//  Copyright © 2017 Leo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {



    @IBOutlet weak var textFieldCity: UITextField!



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func viewWillAppear(_ animated: Bool) {


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }





    @IBAction func buttonActionInsert(_ sender: AnyObject) {


        CoreDataUtility.sharedCoreDataUtility.insertRecord(stringEntityName:"Student_Form", stringRecprd: self.textFieldCity.text!)

    }


    @IBAction func buttonActionDelete(_ sender: AnyObject) {

        CoreDataUtility.sharedCoreDataUtility.deleteRecord(stringEntityName:"Student_Form", stringDeleteRecord: self.textFieldCity.text!)
        
    }


    @IBAction func buttonActionUpdate(_ sender: AnyObject) {

        CoreDataUtility.sharedCoreDataUtility.updateRecord(stringEntityName:"Student_Form", stringCompareRecord: self.textFieldCity.text!, stringUpdateRecprd: "usa")
                
    }

    @IBAction func buttonActionFetch(_ sender: AnyObject) {

        var studentFormObject: Student_Form?

        studentFormObject = CoreDataUtility.sharedCoreDataUtility.fetchRecord(stringEntityName: "Student_Form", stringFetchRecord: self.textFieldCity.text!) as? Student_Form

        print(studentFormObject)
    }


    @IBAction func buttonActionFetchAll(_ sender: AnyObject) {

        var arrayStudentFormObject = [Student_Form]()

        arrayStudentFormObject = CoreDataUtility.sharedCoreDataUtility.fetchAllRecord(stringEntityName:"Student_Form") as! [Student_Form]

        print(arrayStudentFormObject)
    }


    @IBAction func buttonActionDeleteAll(_ sender: AnyObject) {

        CoreDataUtility.sharedCoreDataUtility.deleteAllRecord(stringEntityName:"Student_Form")
        
    }
    

}


