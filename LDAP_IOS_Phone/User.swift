//
//  User.swift
//  LDAP_IOS_Phone
//
//  Created by administrator on 04/04/16.
//  Copyright © 2016 administrator. All rights reserved.
//

import UIKit

class User: NSObject {
    var ID: Int?
    var Last_name: String?
    var First_name: String?
    var Class: String?
    var New: String?
    var Repeating: String?
    var Date_of_birth: String?
    var Swals: String?
    var Nationlity: String?
    var Exit_student: String?
    var Sex: String?
    
    init(ID:Int, Last_name:String, First_name:String,Class:String,New:String,Repeating:String,Date_of_birth:String, Swals:String, Nationality:String, Exit_student:String,Sex:String){
        self.ID = ID;
        self.Last_name = Last_name;
        self.First_name = First_name;
        self.Class = Class;
        self.New = New;
        self.Repeating = Repeating;
        self.Date_of_birth = Date_of_birth;
        self.Swals = Swals;
        self.Nationlity = Nationality;
        self.Exit_student = Exit_student;
        self.Sex = Sex;
    }
    
    init(ID:Int, Last_name:String, First_name:String,Class:String){
        self.ID = ID;
        self.Last_name = Last_name;
        self.First_name = First_name;
        self.Class = Class;
       
    }

    
    override init() {
        
    }
    
    init(ID: Int){
        self.ID = ID;
    }
    
    override var description: String{
        return "(\(First_name)  \(Last_name))";
    }
    
    
}
