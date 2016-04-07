//
//  ViewController.swift
//  LDAP_IOS_Phone
//
//  Created by administrator on 29/03/16.
//  Copyright © 2016 administrator. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var use: User = User();
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    var feedItems: NSMutableArray = NSMutableArray()
    var messItems: NSMutableArray = NSMutableArray()
    let selectedUser: User = User()

    @IBAction func setLogin(sender: UIButton) {
        
        
        
        // Compose a query string
        
        

        
        
        
        if(username.text != "" && password.text != ""){
            let us = username.text!;
            print(us)
            let dn = "uid=\(us),ou=Users,dc=eeb2,dc=be"
            let test = test_user_ldap(nil, dn, password.text!);
            let nsa: NSMutableArray = NSMutableArray();
            
            //let ns: NSString = set.0!;
            nsa.addObject(set.0!);
            nsa.addObject(set.1!);
            nsa.addObject(set.2!);
            nsa.addObject(set.3!);
            nsa.addObject(set.4!);
            print(nsa[0]);
            print(nsa[1]);
            print(nsa[2]);
            print(nsa[3]);
            print(nsa[4]);
            
            
            
            if(test != nil){
               print(test)
                
                error.text = test;
            }else{
                error.text = "";
                
                for(var i = 0; i < feedItems.count; i++){
                    use = feedItems[i] as! User;
                    
                    if  use.ID == Int(username.text!)!{
                        print(use.description);
                    }
                }
                //performSegueWithIdentifier("User", sender: sender);
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let initViewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier("Table") as UIViewController
                    self.presentViewController(initViewController, animated: true, completion: nil)
                    }
                )
                
            }
            
            
            print("login")
            
            //MessageController()
        }else{
            error.text = "Username and password requered";
            print("error")
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myUrl = NSURL(string: "http://extranet.eeb2.eu/app/App/app_student.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, errors in
            
            if data == nil
            {
                print("error=\(errors)")
                return
            }
            
            // You can print out response object
            //print("response = \(response)")
            
            // Print out response body
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print("responseString = \(responseString)")
            
            //Letís convert response sent from a server side script to a NSDictionary object:
            do{
                
                let myJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
                
                if let parseJSON = myJSON as? [String: AnyObject]{
                    print(parseJSON);
                    self.readJSONObject(parseJSON)
                    
                    
                    
                }
                
            }catch{
                
            }
            
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readJSONObject(object: [String: AnyObject]){
        guard let messages = object["student"] as? [[String: AnyObject]] else {return}
        for message in messages{
            guard let id = message["ID"] as? String,
                let screen = message["Last_name"] as? String,
                let mes = message["First_name"] as? String,
                let vis = message["Class"] as? String
                else {break}
            let messqge = User(ID: Int(id)!, Last_name: screen, First_name: mes, Class: vis)
            
                feedItems.addObject(messqge)
            
            
            
            
            print(messqge.description);
            
        }
        self.itemsDownloaded(feedItems)
        
        
    }
    
    func itemsDownloaded(items: NSMutableArray){
        feedItems = items
    }
    



}

