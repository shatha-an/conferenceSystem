//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 08/08/1445 AH.
//

import Foundation
import Vapor
import Fluent
struct CreateSessionAttendee: AsyncMigration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: Database) async throws {
        try await database.schema("SessionAttendee")
            .id()
            .field("Session_id", .uuid, .references("Session", "id"))
            .field("Attendee_id", .uuid, .references("Attendee", "id"))
            .field("Status", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) async throws {
        try await database.schema("SessionAttendee").delete()
    }
}
