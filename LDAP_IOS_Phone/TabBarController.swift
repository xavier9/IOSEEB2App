//
//  TabBarController.swift
//  LDAP_IOS_Phone
//
//  Created by administrator on 07/04/16.
//  Copyright © 2016 administrator. All rights reserved.
//

import Foundation
class TabBarController: UITabBarController {
    var user = User();
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "User"){
            let controller = segue.destinationViewController as! TabBarController
            controller.user = self.user;
            
        }
    }
}