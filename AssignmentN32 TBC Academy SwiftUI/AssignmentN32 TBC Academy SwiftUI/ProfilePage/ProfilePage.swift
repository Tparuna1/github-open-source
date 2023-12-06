//
//  ProfilePage.swift
//  AssignmentN32 TBC Academy SwiftUI
//
//  Created by tornike <parunashvili on 06.12.23.
//


import SwiftUI

struct ProfilePage: View {
    @StateObject private var viewModel = ProfilePageViewModel()
    @State private var isDatePickerShown = false

    
    var body: some View {
        NavigationView {
            VStack {
                Text("Edit Profile")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: EmptyView())
                
                
                Image("AIGen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .overlay(
                        ZStack {
                            Image("Cam")
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
                    
                    Text("Password:")
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.leading)
                    
                    SecureField("Write password", text: $viewModel.password)
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
                    
                    Text("Country/Region:")
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.leading)
                    
                    TextField("Enter your country/region", text: $viewModel.country)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.hideKeyboard()
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
