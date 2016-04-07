//
//  Message.swift
//  IOS_LDAP
//
//  Created by administrator on 25/03/16.
//  Copyright © 2016 administrator. All rights reserved.
//

import Foundation

class Message: NSObject{
    
    var ID: Int?
    var screen: Int?
    var visible: Int?
    var titel: String?
    var message: String?
    var expiredate: String?
    
    override init() {
        
    }
    
    init(ID: Int, screen:Int, visible:Int, titel:String,message:String,expiredate:String){
        self.ID = ID;
        self.screen = screen;
        self.visible = visible;
        self.titel = titel;
        self.message = message;
        self.expiredate = expiredate;
    }
    
    init(ID: Int, screen:Int, visible:Int, message:String){
        self.ID = ID;
        self.screen = screen;
        self.visible = visible;
        
        self.message = message;
        
    }

    
    override var description: String{
        return "(\(message))";
    }
}