//
//  RegistrationView.swift
//  magnesium
//
//  Created by James Saeed on 11/03/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var sex = "Male"
    @State var age = ""
    @State var height = ""
    @State var weight = ""
    @State var activityLevels = "None"
    @State var weightGoal = "Lose"
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    Text("Welcome!")
                        .font(.system(size: 34, weight: .bold, design: .default))
                    RegistrationPickerField(header: "Sex", options: ["Male", "Female"], selected: $sex)
                    RegistrationTextField(header: "Age", text: $age)
                    RegistrationTextField(header: "Height", text: $height)
                    RegistrationTextField(header: "Weight", text: $weight)
                    RegistrationPickerField(header: "Activity Levels", options: ["None", "Light", "Average", "High", "Extra"], selected: $activityLevels)
                    RegistrationPickerField(header: "Weight Goal", options: ["Lose", "Maintain", "Gain"], selected: $weightGoal)
                }.padding(.horizontal, 20)
                .padding(.vertical, 24)
            }
        }
    }
}

private struct RegistrationTextField: View {
    
    let header: String
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(header)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .padding(.leading, 8)
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .frame(height: 44)
                TextField("", text: $text)
                    .autocapitalization(.none)
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
            }
        }
    }
}

private struct RegistrationPickerField: View {
    
    let header: String
    let options: [String]
    
    @Binding var selected: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(header)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .padding(.leading, 8)
            Picker("", selection: $selected) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
    }
}
