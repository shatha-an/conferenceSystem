//
//  File.swift
//  
//
//  Created by Shatha Ajjaj on 08/08/1445 AH.
//

import Foundation
import Vapor
import Fluent
struct CreateSession: AsyncMigration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: Database) async throws {
        try await database.schema("Session")
            .id()
            .field("title", .string)
            .field("disc", .string)
            .field("SpeakerName", .string)
            .field("HallNumber", .string)
            .field("StartTime", .string)
            .field("EndTime", .string)
            .field("Status", .string)
            .field("Location", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) async throws {
        try await database.schema("Session").delete()
    }
}
