//
//  FirebaseManager.swift
//  FlatironChat
//
//  Created by Johann Kerr on 3/29/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import Foundation
import FirebaseDatabase
import FirebaseAuth
import JSQMessagesViewController

class FirebaseManager {
    
    static let allRef = FIRDatabase.database().reference()
    static let userRef = allRef.child("users")
    static let messageRef = allRef.child("messages")
    static let channelRef = allRef.child("channels")
    
    class func checkForChannel(_ channelId: String, completion:@escaping(Bool)->()) {
        
        FIRDatabase.database().reference().child("channels").observeSingleEvent(of: .value, with: { (snapshot) in
            let channels = snapshot.value as! [String: Any]
            if (channels[channelId] != nil) {
                completion(true)
            } else {
                completion(false)
            }
            
        })
        
    }
    
    
    class  func createChannel(_ channelId: String, completion:() -> ()) {
        if let user = UserDefaults.standard.string(forKey: "screenName") {
            FIRDatabase.database().reference().child("channels/\(channelId)").child("participants").child(user).setValue(true)
            FIRDatabase.database().reference().child("users").child("\(user)").child("channels").child(channelId).setValue(true)
            
            completion()
        }
    }

    
    class func sendMessage(to channel: String, msg: String) {
        // need to get myself
        
        if let user = UserDefaults.standard.string(forKey: "screenName") {
            userRef.child(user).child("channels").child(channel).setValue(true)
            channelRef.child(channel).child("lastMessage").setValue(msg)
            let msgDict = ["content": msg, "from": user]
            messageRef.child(channel).childByAutoId().setValue(msgDict)
            channelRef.child(channel).child("participants").updateChildValues([user: true])
            
            
            
        }
        
        
        
        //       userRef.child("channels").setValue([channel.name: true])
        
        
        // update last Message
        // update User with the channel
        // actually send the message i.e add it to message
        // update the channel
    }
    
    class func login(completion:@escaping (Bool) -> ()) {
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
                completion(false)
            } else {
                completion(true)
            }
            
        })
    }
    
    class func getMessages(from channel:String, completion: @escaping (JSQMessage)->()) {
        var messages = [JSQMessage]()
        print("getting messages")
        print(channel)
        messageRef.child(channel).observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            let messageDict = snapshot.value as? [String: String]
            if let content = messageDict?["content"], let from = messageDict?["from"] {
                if let message = JSQMessage(senderId: from, displayName: from, text: content) {
                    completion(message)
                }
                
            }
            
            
        })
        
    }
    
    
    class func getChannels(completion: @escaping ([Channel]) -> ()) {
        var channels = [Channel]()

        channelRef.observe(.value, with: { (snapshot) in
            let snapshots = snapshot.children
            for snap in snapshots {
                print(snap)
                
                
                if  let innerSnapshot = snap as? FIRDataSnapshot {
                    let channel = Channel(snap: innerSnapshot)
                    channels.append(channel)
                    print(channels)
                }
                /*
                 
                 let channelDict = innerSnapshot?.value as? [String: Any]
                 let lastMessage = channelDict?["lastMessage"] as? String ?? nil
                 let participantsDict = channelDict?["participants"] as? [String: Any]
                 let participantCount = participantsDict?.count ?? 0
                 if let channelId = innerSnapshot?.key {
                 let channel = Channel(name: channelId, lastMsg: lastMessage, numberOfParticipants: participantCount)
                 }
                 */
                
                
            }
            completion(channels)
            
        })
        
        
    }
    
}
