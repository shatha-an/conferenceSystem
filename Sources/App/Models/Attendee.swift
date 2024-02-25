//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 08/08/1445 AH.
//
import Foundation
import Fluent
import Vapor
final class Attendee: Model, Content{
    // Name of the table or collection.
    static let schema = "Attendee"

    // Unique identifier for this Galaxy.
    @ID(key: .id)
    var id: UUID?

  
    @Field(key: "FullName")
    var FullName: String
    
    @Field(key: "Email")
    var Email: String
    
    @Siblings(through: SessionAttendee.self, from: \.$Attendee, to: \.$Session)
        public var Sessions: [Session]

    // Creates a new, empty Galaxy.
    init() { }

    // Creates a new Galaxy with all properties set.
    init(id: UUID? = nil, FullName: String, Email: String) {
        self.id = id
        self.FullName = FullName
        self.Email = Email
        
    }
}

