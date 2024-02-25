//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 08/08/1445 AH.
//

import Foundation
import Vapor
import Fluent
struct CreateAttendee: AsyncMigration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: Database) async throws {
        try await database.schema("Attendee")
            .id()
            .field("FullName", .string)
            .field("Email", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) async throws {
        try await database.schema("Attendee").delete()
    }
}
