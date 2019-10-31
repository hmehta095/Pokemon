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
            
}
    
    
    
    
   
 
}
