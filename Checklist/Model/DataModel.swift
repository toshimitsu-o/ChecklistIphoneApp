//
//  DataModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 5/4/2023.
//
import Foundation

/// Model to store user's checklists
class DataModel: Codable, ObservableObject {
    /// Array of Checklist
    @Published var checklists: [Checklist]
    @Published var loadingCompleted = false
    
    static var model: DataModel?
    
    enum CodingKeys: CodingKey {
        case checklists
    }
    private init() {
        checklists = []
        load()
    }
    
    /// guarantee there is only one DataModel created.
    static func getDataModel()->DataModel {
        guard let model = DataModel.model else {
            let model = DataModel()
            DataModel.model = model
            return model
        }
        return model
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(checklists, forKey: .checklists)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        checklists = try container.decode([Checklist].self, forKey: .checklists)
    }
    
    func getFile()->URL {
        let filename = "checklist.json"
        let fm = FileManager.default
        let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        return url.appendingPathComponent(filename)
    }
    func save() {
        do{
            let url = getFile()
            let data = try JSONEncoder().encode(self)
            try data.write(to: url)
        } catch {
            print("Saving failed: \(error)")
        }
    }
    
    private func asyLoad() async ->DataModel? {
        do{
            let url = getFile()
            let datastr = try Data(contentsOf: url)
            let data = try JSONDecoder().decode(DataModel.self, from: datastr)
            return data
        }
        catch {
            print("Loading failed: \(error)")
        }
        return nil
    }
    
    func load() {
        Task {
            guard let data = await asyLoad() else {
                // When there is no saved data
                DispatchQueue.main.async {
                    self.loadingCompleted = true
                }
                return
            }
            /// withouth sleep, you can't observe the loading page...
            try? await Task.sleep(nanoseconds: 1000_000_000)
            DispatchQueue.main.async {
                self.checklists = data.checklists
                self.loadingCompleted = true
            }
        }
    }
}

/// Save model data from any view in the app
func saveData() {
    let model = DataModel.getDataModel()
    model.save()
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
