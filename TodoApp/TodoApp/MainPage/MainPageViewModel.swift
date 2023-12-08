//
//  MainPageViewModel.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//

import Foundation


class MainPageViewModel: ObservableObject {
    @Published var tasks: [MainPageModel] = []
    
    init() {
        if let savedTasks = UserDefaults.standard.data(forKey: "tasks") {
            let decoder = JSONDecoder()
            if let loadedTasks = try? decoder.decode([MainPageModel].self, from: savedTasks) {
                tasks = loadedTasks
            }
        }
    }
    
    func saveTasks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
    
    func addTask(title: String) {
        let newTask = MainPageModel(title: title)
        tasks.append(newTask)
        saveTasks()
    }
    
    func toggleTaskCompleted(task: MainPageModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].completed.toggle()
            saveTasks()
        }
    }
    
    func removeTask(task: MainPageModel) {
        tasks.removeAll(where: { $0.id == task.id })
        saveTasks()
    }
}
