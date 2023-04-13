//
//  DataModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 5/4/2023.
//
import Foundation

/// Model to store user's checklists
struct DataModel: Codable {
    /// Array of Checklist
    var checklists: [Checklist]
    
    static func getDataModel()->DataModel {
        var model = DataModel(checklists: testChecklists)
        try? model.load()
        return model
    }
    
    /// Load data decoded from saved JSON file
    mutating func load() {
        guard let url = getFile(),
              let data = try? Data(contentsOf: url),
              let datamodel = try? JSONDecoder().decode(DataModel.self, from: data)
        else {
            print("Loading failed")
            return
        }
        self.checklists = datamodel.checklists
    }
    
    /// Save data as JSON file encoded from DataMdel
    func save() {
        do {
            guard let url = getFile(),
                  let data = try? JSONEncoder().encode(self)
            else {
                print("Saving failed")
                return
            }
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    /// Get location of JSON file and return as URL
    ///
    /// - Returns: URL of JSON file in document directory with the file name
    func getFile () -> URL? {
        let filename = "checklist.json"
        let fm = FileManager.default
        guard let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.allDomainsMask).first else {
            return nil
        }
        return url.appendingPathComponent(filename)
    }
}

/// Sample array of Checklist containing an array of Todo
var testChecklists = [
    Checklist(title: "MAD tasks", todos: [
        Todo(task: "Read Swift book", time: .mon, isDone: true),
        Todo(task: "Review lecture slides", time: .tue, isDone: true),
        Todo(task: "Do workshop tasks", time: .wed, isDone: true),
        Todo(task: "Attend workshop", time: .thu, isDone: false),
        Todo(task: "Read additional readings", time: .fri, isDone: false)
    ])
]
