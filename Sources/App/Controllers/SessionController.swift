//
//  File.swift
//
//
//  Created by Shatha Ajjaj on 05/08/1445 AH.
//

import Foundation
import Vapor
import Fluent
struct SessionController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let Session = routes.grouped("Session")
        
        //get all sessions
        Session.get("all",use: GetallSession)
        //Post session
        Session.post(use: create)
        //Delete
        Session.delete(":SessionID", use: deleteSession)
        //update session
        Session.put(":SessionID", use: updateSession)
        

    }
    //Create new session
    func create(req: Request) async throws -> Session {
        let Session = try req.content.decode(Session.self)
        try await Session.save(on: req.db)
        return Session
    }
    
    //Display all sessions
    func GetallSession(req: Request) async throws -> [Session] {
            try await Session.query(on: req.db).all()
        }
    
    
       //Update session
       func updateSession(req: Request) async throws -> Session {
           guard let session = try await Session.find(req.parameters.get("SessionID"), on: req.db) else {
               throw Abort(.notFound)
           }
           //update title
           let updatedTitle = try req.content.decode(Session.self)
           session.title = updatedTitle.title
           //update disc
           let updatedDisc = try req.content.decode(Session.self)
           session.disc = updatedDisc.disc
           //update Speaker name
           let updatedSpeakerName = try req.content.decode(Session.self)
           session.SpeakerName = updatedSpeakerName.SpeakerName
           //update Hall number
           let updatedHallNumber = try req.content.decode(Session.self)
           session.HallNumber = updatedHallNumber.HallNumber
           //update Start time
           let updatedStartTime = try req.content.decode(Session.self)
           session.StartTime = updatedStartTime.StartTime
           //update End time
           let updatedEndTime = try req.content.decode(Session.self)
           session.EndTime = updatedEndTime.EndTime
           //update status
           let updatedSession = try req.content.decode(Session.self)
           session.Status = updatedSession.Status
           //update Location
           let updatedLocation = try req.content.decode(Session.self)
           session.Location = updatedLocation.Location
           try await session.save(on: req.db)
           return session
       }
       
    
    
    
    //delete session
        func deleteSession(req: Request) async throws -> HTTPStatus {
            guard let session = try await Session.find(req.parameters.get("SessionID"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await session.delete(on: req.db)
            return .ok
        }
    
}

