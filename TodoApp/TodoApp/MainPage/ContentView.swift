//
//  ContentView.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//

import SwiftUI

struct TaskListView: View {
    var taskViewModel = MainPageViewModel()

    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Button(action: taskViewModel.completeAllTasks) {
                    Text("Complete All")
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(red: 186/255,
                                                                  green: 131/255,
                                                                  blue: 222/255),
                                                            Color(red: 222/255,
                                                                  green: 131/255,
                                                                  blue: 176/255)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(10)
                        .padding()
                }
                
                List {
                    Section(header: Text("Progress")) {
                        VStack{
                            Text("You have \(taskViewModel.incompleteTasksCount()) tasks to Complete");                           ProgressView(value: taskViewModel.calculateCompletionProgress())
                                .progressViewStyle(DarkBlueShadowProgressViewStyle())
                        }
                    }
                    
                    Section(header: Text("Uncompleted Tasks")) {
                        ForEach(taskViewModel.tasks.filter { !$0.completed }) { task in
                            TaskRowView(
                                viewModel: taskViewModel,
                                task: task,
                                sectionColor: taskViewModel.generateSectionColor(isCompleted: false)
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
                                sectionColor: taskViewModel.generateSectionColor(isCompleted: true)
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
                    TextField("Enter task", text: $taskViewModel.newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: taskViewModel.addTask) {
                        Text("Add")
                    }
                }
                .padding()
            }
            .navigationBarItems(
//                leading: Text("You have \(taskViewModel.incompleteTasksCount()) tasks to Complete"),
                trailing:
                    VStack {
                        NavigationLink(destination: ProfilePage()) {
                            Image("Luffy2")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                        .overlay(
                            Text("\(taskViewModel.incompleteTasksCount())")
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
    
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6), radius: 4.0, x: 1.0, y: 2.0)
            .tint(
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 186/255,
                                                      green: 131/255,
                                                      blue: 222/255),
                                                Color(red: 222/255,
                                                      green: 131/255,
                                                      blue: 176/255)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .padding(.horizontal, 20)
            .frame(height: 20)
            .cornerRadius(10)
    }
}

struct TaskRowView: View {
    @State var viewModel: MainPageViewModel
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
