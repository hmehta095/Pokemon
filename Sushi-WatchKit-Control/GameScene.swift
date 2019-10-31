//
//  GameScene.swift
//  himu
//
//  Created by Himanshu Mehta on 2019-10-29.
//  Copyright © 2019 Himanshu Mehta. All rights reserved.
//

import SpriteKit
import GameplayKit
import WatchConnectivity

class GameScene: SKScene, WCSessionDelegate {
    var frameCount:Int = 0
    var flag:Bool = false
    var time:Int = 0
    
    
        func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
            
        }
        
        func sessionDidBecomeInactive(_ session: WCSession) {
            
        }
        
        func sessionDidDeactivate(_ session: WCSession) {
            
        }
        
        
        func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
            // Output message to terminal
            print("WATCH: I received a message: \(message)")
            let name = message["name"] as! String
            print(name)

          

        }
    

   
    
    

    override func didMove(to view: SKView) {
                          if(WCSession.isSupported() == true){
        //                      checkConnection.text = "WC is supported"
                              
                  //            create a communication session with the watch?
                                  let session = WCSession.default
                                       session.delegate = self
                                       session.activate()
                                   }
                                   else {
        //                               checkConnection.text = "WC NOT supported!"
                                   }

 
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        frameCount = frameCount+1
        if(frameCount % 60 == 0){
            time = time + 1
            if(WCSession.default.isReachable == true){
            //            Here is the message you want to send to the watch
                let message = ["name1":"\(time)","name": "", "wake": "true"] as [String : Any]
                       WCSession.default.sendMessage(message, replyHandler: nil)
                       }

        }
        
            
}
    
    
    
    
   
 
}
