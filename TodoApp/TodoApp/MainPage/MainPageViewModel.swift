//
//  MainPageViewModel.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//

import Foundation
import SwiftUI


@Observable class MainPageViewModel {
    var tasks: [MainPageModel] = []
    var newTaskTitle = ""
    var isAddingTask = false
    
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
        func completeAllTasks() {
            tasks.indices.forEach { index in
                tasks[index].completed = true
            }
            saveTasks()
        }
        
        func addTask() {
            if !newTaskTitle.isEmpty {
                addTask(title: newTaskTitle)
                newTaskTitle = ""
            }
        }
        
        func incompleteTasksCount() -> Int {
            return tasks.filter { !$0.completed }.count
        }
        func generateSectionColor(isCompleted: Bool) -> Color {
            return isCompleted ? Color.blue : Color.pink
        }
        
        func calculateCompletionProgress() -> Double {
            let totalTasks = tasks.count
            let completedTasks = tasks.filter { $0.completed }.count
            return Double(completedTasks) / Double(totalTasks)
        }
}
