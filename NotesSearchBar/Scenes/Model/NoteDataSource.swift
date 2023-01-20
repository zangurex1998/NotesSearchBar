//
//  NoteDataSource.swift
//  NotesSearchBar
//
//  Created by technomix on 16.01.23.
//

import Foundation

class NoteDataSource{
    static let shared = NoteDataSource() 
    var notes: [Note] = [
        .init(header: "Giorgi", text: "Gioo"),
        .init(header: "George", text: "Hello"),
        .init(header: "Gg", text: "Gh")
        
    ]
}
