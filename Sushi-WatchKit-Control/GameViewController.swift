//
//  GameViewController.swift
//  Sushi-WatchKit-Control
//
//  Created by Himanshu Mehta on 2019-10-30.
//  Copyright © 2019 Himanshu Mehta. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import WatchConnectivity

class GameViewController: UIViewController,WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Output message to terminal
        print("WATCH: I received a message: \(message)")

      

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size:self.view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        
        // property to show hitboxes
        skView.showsPhysics = true
        
        skView.presentScene(scene)
        
        
                                 if(WCSession.isSupported() == true){

                                         let session = WCSession.default
                                              session.delegate = self
                                              session.activate()
                                          }
                                          else {
               //                               checkConnection.text = "WC NOT supported!
                                          }

        
           }

        
    
    
    
    
    
    @IBAction func CaterpieButtonPressed(_ sender: Any) {
           print("You pressed the caterpie button")
                 if(WCSession.default.isReachable == true){
                 //            Here is the message you want to send to the watch
                             let message = ["name":"caterpie"]
                             WCSession.default.sendMessage(message, replyHandler: nil)

                             }
           
       }
       
       @IBAction func pikachuButtonPressed(_ sender: Any) {
           print("You pressed the pikachu button")
                 if(WCSession.default.isReachable == true){
                 //            Here is the message you want to send to the watch
                             let message = ["name":"pikachu"]
                             WCSession.default.sendMessage(message, replyHandler: nil)

                             }
           
           
       }

  
}
