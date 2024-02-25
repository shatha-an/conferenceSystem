//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 08/08/1445 AH.
//

import Foundation
import Fluent
import Vapor
final class SessionAttendee: Model, Content {
    // Name of the table or collection.
    static let schema = "SessionAttendee"
    @ID(key: .id)
    var id: UUID?
    // Unique identifier for this Galaxy.
    @Parent(key: "Session_id")
    var Session: Session
    
    @Parent(key: "Attendee_id")
    var Attendee: Attendee

    @Field(key: "Status")
    var Status: String
    

    // Creates a new, empty Galaxy.
    init() { }

    // Creates a new Galaxy with all properties set.
    init(id: UUID? = nil,Session: Session, Attendee: Attendee, Status: String) throws{
        self.id = id
        self.$Session.id = Session.id!
        self.$Attendee.id = Attendee.id!
        self.Status = Status
        
    }
}
