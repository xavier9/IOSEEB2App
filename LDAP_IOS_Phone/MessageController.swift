//
//  ViewController.swift
//  nsurlsession_tutorial


import UIKit

class MessageController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var listTableView: UITableView!
    var feedItems: NSMutableArray = NSMutableArray()
    var messItems: NSMutableArray = NSMutableArray()
    let selectedMessage : Message = Message()
    var user: User = User();
    
    let url_to_request:String = "http://extranet.eeb2.eu/app/App/app_messages.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vies: ViewController = ViewController();
        user = vies.use;
        print(user.description);
        let myUrl = NSURL(string: "http://extranet.eeb2.eu/app/App/app_messages.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        
        // Compose a query string
        
        
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
                    //print(parseJSON);
                    self.readJSONObject(parseJSON)
                    self.listTableView.delegate = self
                    self.listTableView.dataSource = self
                    self.listTableView.estimatedRowHeight = 1000.0
                    self.listTableView.rowHeight = UITableViewAutomaticDimension
                    
                    
                }
                
            }catch{
                
            }
            
        }
        
        task.resume()

        
    
    }
    func readJSONObject(object: [String: AnyObject]){
        guard let messages = object["message"] as? [[String: AnyObject]] else {return}
        for message in messages{
            guard let id = message["message_ID"] as? String,
                let screen = message["screen_ID"] as? String,
                let mes = message["message"] as? String,
                let vis = message["visibility"] as? String
                else {break}
             let messqge = Message(ID: Int(id)!, screen: Int(screen)!, visible: Int(vis)!, message: mes)
            if messqge.visible == 1 {
                feedItems.addObject(messqge)
            }
            
            //print(messqge.description);
            
        }
        self.itemsDownloaded(feedItems)
        
        
    }
    
    func itemsDownloaded(items: NSMutableArray){
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(feedItems.count);
        return feedItems.count
    }
    

    @IBOutlet weak var name: UILabel!
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellI: String = "BasicCell"
        let myC: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellI)!
        
        
        let item: Message = feedItems[indexPath.row] as! Message
        
        
        
                
            
        
        
        let attrstr = try! NSAttributedString(data: item.message!.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!, options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
                myC.textLabel?.text = attrstr.string
        
        return myC
        
    }
    
    

}

