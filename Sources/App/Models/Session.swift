//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 08/08/1445 AH.
//

import Foundation
import Fluent
import Vapor
final class Session: Model , Content{
    // Name of the table or collection.
    static let schema = "Session"

    // Unique identifier for this Galaxy.
    @ID(key: .id)
    var id: UUID?

  
    @Field(key: "title")
    var title: String
    
    @Field(key: "disc")
    var disc: String
    
    @Field(key: "SpeakerName")
    var SpeakerName: String
    
    @Field(key: "HallNumber")
    var HallNumber: String
    
    @Field(key: "StartTime")
    var StartTime: String
    @Field(key: "EndTime")
    var EndTime: String
    //change string to bool
    
    
    @Field(key: "Status")
    var Status: String
    
    @Field(key: "Location")
    var Location: String

    @Siblings(through: SessionAttendee.self, from: \.$Session, to: \.$Attendee)
        public var Attendees: [Attendee]
    // Creates a new, empty Galaxy.
    init() { }

    // Creates a new Galaxy with all properties set.
    init(id: UUID? = nil, title: String, disc: String, SpeakerName: String,HallNumber:String, StartTime: String,
         EndTime: String,Status: String,Location:String) {
        self.id = id
        self.title = title
        self.disc = disc
        self.SpeakerName = SpeakerName
        self.HallNumber = HallNumber
        self.StartTime = StartTime
        self.EndTime = EndTime
        self.Status = Status
        self.Location = Location
    }
}

