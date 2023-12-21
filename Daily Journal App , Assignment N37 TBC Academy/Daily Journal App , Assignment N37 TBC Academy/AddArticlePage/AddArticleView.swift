//
//  AddArticleView.swift
//  Daily Journal App , Assignment N37 TBC Academy
//
//  Created by tornike <parunashvili on 20.12.23.
//

import SwiftUI

struct AddArticleView: View {
    @Environment(\.presentationMode) var presentationMode
    var journalViewModel: JournalViewModel
    @State private var title = ""
    @State private var text = ""
    @State private var selectedDate = Date()
    
    var body: some View {
        Form {
            Section(header: Text("New Entry")) {
                TextField("Title", text: $title)
                TextEditor(text: $text)
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
            }
            
            Button("Save") {
                journalViewModel.addEntry(title: title, text: text)
                title = ""
                text = ""
                selectedDate = Date()
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Add Article")
    }
}



struct AddArticleView_Previews: PreviewProvider {
    static var previews: some View {
        AddArticleView(journalViewModel: JournalViewModel())
    }
}

