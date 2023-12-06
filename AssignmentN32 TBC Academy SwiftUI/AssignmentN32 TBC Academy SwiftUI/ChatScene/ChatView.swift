//
//  ChatView.swift
//  AssignmentN32 TBC Academy SwiftUI
//
//  Created by tornike <parunashvili on 06.12.23.
//

import SwiftUI

struct ChatListView: View {
    @StateObject private var viewModel = ChatListViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: ProfilePage()) {
                        Image("AIGen")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .padding(.leading)
                    }
                    
                    Spacer()
                    
                    Text("Chat")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.switchColorScheme()
                    }) {
                        Image(systemName: viewModel.isDarkMode ? "sun.max.fill" : "moon.fill")
                            .foregroundColor(viewModel.isDarkMode ? .white : .black)
                            .imageScale(.large)
                            .padding(.trailing)
                    }
                    
                    .padding()
                }
                
                List {
                    ForEach(viewModel.chatAccounts.indices, id: \.self) { index in
                        if !viewModel.chatAccounts[index].isRemoved {
                            NavigationLink(destination: Text("Chat with \(viewModel.chatAccounts[index].name)")) {
                                HStack(spacing: 15) {
                                    Image(viewModel.chatAccounts[index].profileImageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(viewModel.chatAccounts[index].name)
                                            .font(.headline)
                                        
                                        Text(viewModel.chatAccounts[index].messageSnippet)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .lineLimit(1)
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .preferredColorScheme(viewModel.isDarkMode ? .dark : .light)
                
                Button(action: {
                    viewModel.toggleChatRemoval()
                }) {
                    Text(viewModel.isChatRemoved ? "Restore chat" : "Clear chat")
                        .foregroundColor(.white)
                        .frame(width: 221, height: 45)
                        .background(Color(red: 0.143, green: 0.152, blue: 0.375))
                        .cornerRadius(6)
                }
                .padding(.bottom, 30)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("All chat is removed"))
                }
            }
            .padding()
        }
    }
}




#Preview {
    ChatListView()
}
