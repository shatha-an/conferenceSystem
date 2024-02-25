//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 05/08/1445 AH.
//

import Foundation
import Vapor
import Fluent

struct AttendSessionController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let AttendSession = routes.grouped("AttendSession")
        // Update Attend Status by id
        AttendSession.put("UpdateAttendeeStatus",":id",use: updateAttendeeStatus)
       // Add new session for attendee
        AttendSession.post("addNewAttendSession" , use: AttendNewSessionForAttendee )

    }
    
    
    //update  status
    func updateAttendeeStatus(req: Request) async throws -> SessionAttendee {
        guard let sessionAttendee = try await SessionAttendee.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        let updatedSessionAttendee = try req.content.decode(SessionAttendee.self)
        sessionAttendee.Status = updatedSessionAttendee.Status
        try await sessionAttendee.save(on: req.db)
        return sessionAttendee
    }
   
    
    
    //Add new session for attendee
    func AttendNewSessionForAttendee(req: Request) async throws -> SessionAttendee{
        let SessionAttendee = try req.content.decode(SessionAttendee.self)

                guard let session = try await Session.find(SessionAttendee.$Session.id, on: req.db) else {
                    throw Abort(.notFound)
                }
                
                guard let attendee = try await Attendee.find(SessionAttendee.$Attendee.id, on: req.db) else {
                    throw Abort(.notFound)
                }
        
                
                
        
        try await session.$Attendees.attach(attendee, on: req.db) { pivot in
            pivot.Status = SessionAttendee.Status
                }
        
        
        return SessionAttendee
        
            }

    }
    
    
