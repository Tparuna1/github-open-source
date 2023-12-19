//
//  ProfilePageView.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//

import SwiftUI

struct ProfilePage: View {
    @StateObject private var viewModel = ProfilePageViewModel()
    @State private var isDatePickerShown = false

    
    var body: some View {
        NavigationView {
            VStack {
                Image("Luffy2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .overlay(
                        ZStack {
                            Image(systemName:"camera.fill")
                                .foregroundColor(.white)
                                .onTapGesture {
                                    
                                }
                        }
                            .offset(x: 60, y: 50)
                    )
                    .shadow(radius: 7)
                    .padding(.top, 20)
                
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.leading)
                    
                    TextField("Gulnari", text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.hideKeyboard()
                            isDatePickerShown = false
                        }
                    
                    Text("Email")
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.leading)
                    
                    TextField("Gulnari@gmail.com", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.hideKeyboard()
                            isDatePickerShown = false
                        }
                    
                    Text("Date of Birth:")
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.leading)
                    
                    TextField("Select date of birth", text: .constant(viewModel.formatDate(viewModel.dateOfBirth)))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.hideKeyboard()
                            isDatePickerShown.toggle()
                        }
                    
                    if isDatePickerShown {
                        DatePicker("", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding(.horizontal)
                    }
                    
                }
                .padding(.top, 20)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Save Changes")
                        .foregroundColor(.white)
                        .frame(width: 221, height: 45)
                        .background(Color(red: 0.143, green: 0.152, blue: 0.375))
                        .cornerRadius(6)
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
    }
}



#Preview {
    ProfilePage()
}
