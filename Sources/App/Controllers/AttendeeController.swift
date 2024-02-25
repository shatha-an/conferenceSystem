//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 05/08/1445 AH.
//

import Foundation
import Vapor
struct AttendeeController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        let Attendee = routes.grouped("Attendee")
        // Get all Attendee
        Attendee.get("info",use: allAttendee)
        // Add new Attendee
        Attendee.post(use: create)
      
    }
    
    //create attendee
    func create(req: Request) async throws -> Attendee {
        let Attendee = try req.content.decode(Attendee.self)
        try await Attendee.save(on: req.db)
        return Attendee
    }
    
    
    //get all Attendee info
    func allAttendee(req: Request) async throws -> [Attendee] {
            try await Attendee.query(on: req.db).all()
        }



    
}

