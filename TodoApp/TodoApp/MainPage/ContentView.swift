//
//  ContentView.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskViewModel = MainPageViewModel()
    @State private var newTaskTitle = ""
    @State private var isAddingTask = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Button(action: completeAllTasks) {
                    Text("Complete All")
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(red: 186/255, green: 131/255, blue: 222/255),
                                                            Color(red: 222/255, green: 131/255, blue: 176/255)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(10)
                        .padding()
                }
                
                List {
                    Section(header: Text("Progress")) {
                        // ... (Content for 'Progress' section)
                    }
                    
                    Section(header: Text("Uncompleted Tasks")) {
                        ForEach(taskViewModel.tasks.filter { !$0.completed }) { task in
                            TaskRowView(
                                viewModel: taskViewModel,
                                task: task,
                                sectionColor: generateSectionColor(isCompleted: false)
                            )
                            .swipeActions {
                                Button(role: .destructive) {
                                    taskViewModel.removeTask(task: task)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Completed Tasks")) {
                        ForEach(taskViewModel.tasks.filter { $0.completed }) { task in
                            TaskRowView(
                                viewModel: taskViewModel,
                                task: task,
                                sectionColor: generateSectionColor(isCompleted: true)
                            )
                            .swipeActions {
                                Button(role: .destructive) {
                                    taskViewModel.removeTask(task: task)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .cornerRadius(10)
                .padding()
                
                HStack {
                    TextField("Enter task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addTask) {
                        Text("Add")
                    }
                }
                .padding()
            }
            .navigationBarItems(
                            leading: Text("You have \(incompleteTasksCount()) tasks to Complete"),
                            trailing:
                                VStack {
                                    NavigationLink(destination: ProfilePage()) {
                                        Image("Luffy2")
                                            .resizable()
                                            .frame(width: 45, height: 45)
                                            .clipShape(Circle())
                                    }
                                    .overlay(
                                        Text("\(incompleteTasksCount())")
                                            .foregroundColor(.white)
                                            .frame(width: 20, height: 20)
                                            .background(Color.pink)
                                            .clipShape(Circle())
                                            .offset(x: 25, y: 15)
                                    )
                                }
                        )
                    }
                }
    func completeAllTasks() {
        taskViewModel.tasks.indices.forEach { index in
            taskViewModel.tasks[index].completed = true
        }
        taskViewModel.saveTasks()
    }
    
    func addTask() {
        if !newTaskTitle.isEmpty {
            taskViewModel.addTask(title: newTaskTitle)
            newTaskTitle = ""
        }
    }
    
    func incompleteTasksCount() -> Int {
        return taskViewModel.tasks.filter { !$0.completed }.count
    }
    func generateSectionColor(isCompleted: Bool) -> Color {
            return isCompleted ? Color.blue : Color.pink
    }
}


struct TaskRowView: View {
    @ObservedObject var viewModel: MainPageViewModel
    var task: MainPageModel
    var sectionColor: Color
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(sectionColor)
                .frame(width: 15, height: 75)
            
            HStack {
                Text(task.title)
                Spacer()
                if task.completed {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 25, height: 25)
                        .overlay(
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                        )
                } else {
                    Circle()
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 25, height: 25)
                }
            }
            
        }
        .cornerRadius(10)
        .contextMenu {
            Button(action: {
                viewModel.removeTask(task: task)
            }) {
                Label("Delete", systemImage: "trash")
            }
        }
        .onTapGesture {
            viewModel.toggleTaskCompleted(task: task)
        }
    }
}





#Preview {
    TaskListView()
}
