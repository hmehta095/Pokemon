//
//  InterfaceController.swift
//  Sushi-WatchKit-Control WatchKit Extension
//
//  Created by Himanshu Mehta on 2019-10-25.
//  Copyright © 2019 Himanshu Mehta. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController,WCSessionDelegate {
    @IBOutlet weak var healthLabel: WKInterfaceLabel!
    @IBOutlet weak var showTime: WKInterfaceLabel!
    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var name: WKInterfaceLabel!
    
    var hungerCount:Int = 0
    var health:Int = 100
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
   
}
    @IBOutlet weak var hunger: WKInterfaceLabel!
    // Function to receive DICTIONARY from the watch

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Output message to terminal
        print("WATCH: I received a message: \(message)")
        
        // Get the "name" key out of the dictionary
        // and show it in the label
        let name = message["name"] as! String
        let name1 = message["name1"] as! String

        print(name)
        
         if(name == "pikachu"){
        //            pokemonImageView.setImage("pikachu")
                    image.setImageNamed("pikachu")
//                    self.nameLabel.setText("pikachu")
                }
                if(name == "caterpie"){
                //  pokemonImageView.setImage("pikachu")
                    image.setImageNamed("caterpie")
//                    self.nameLabel.setText("caterpie")

                        }
        
        showTime.setText("\(name1)")
        if(Int(name1)! % 5 == 0 && hungerCount < 101){
            hungerCount = hungerCount+10
            hunger.setText("\(hungerCount)")
        }
        if(hungerCount>80 && Int(name1)! % 5 == 0 && health > 0){
            health = health - 5
            healthLabel.setText("\(health)")
        }
        
    }

   
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("---WATCH APP LOADED")
        healthLabel.setText("100")
        if (WCSession.isSupported() == true) {
//            msgFromPhoneLabel.setText("WC is supported!")
            
            // create a communication session with the phone
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
//            msgFromPhoneLabel.setText("WC NOT supported!")
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
 
    @IBAction func nameButtonPressed() {
        
        let suggestedResponses = ["Himu", "Manjit", "Simran"]
                presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) {

            (results) in
                    
                   
           if (results != nil && results!.count > 0) {
              // 2. write your code to process the person's response
            let userResponse = results?.first as? String
            self.name.setText(userResponse)

           }
        }
    }
    
    @IBAction func gameStartPressed() {
        if(WCSession.default.isReachable == true){
        //            Here is the message you want to send to the watch
            let message = ["name":"true"] as [String : Any]
                   WCSession.default.sendMessage(message, replyHandler: nil)
                   }
        
        
    }
    @IBAction func feedButtonPressed() {
        if(hungerCount > 12 && hungerCount<101){
            hungerCount = hungerCount - 12
            hunger.setText("\(hungerCount)")
        }
        
    }
}
