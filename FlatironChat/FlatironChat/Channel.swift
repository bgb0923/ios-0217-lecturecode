//
//  Channel.swift
//  FlatironChat
//
//  Created by Johann Kerr on 3/24/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct Channel {
    var name: String
    var lastMsg: String?
    var numberOfParticipants: Int
    
    
    
    init(snap: FIRDataSnapshot) {
        
        let channelDict = snap.value as? [String: Any]
        let lastMessage = channelDict?["lastMessage"] as? String ?? nil
        let participantsDict = channelDict?["participants"] as? [String: Any]
        let participantCount = participantsDict?.count ?? 0
        
        self.lastMsg = lastMessage
        self.numberOfParticipants = participantCount
        self.name = snap.key
    }
    
    
    
}
