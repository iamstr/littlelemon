//
//  LittlelemonCapstoneApp.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 26/04/2024.
//

import SwiftUI

@main
struct LittlelemonCapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

extension View {
    func backgroundColor(_ hex: String) -> some View {
        let color = Color(hex: hex)
        return self.background(color)
    }
}


extension Color {
    static let primaryColor1 = Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1))
    static let secondaryColor1 = Color(#colorLiteral(red: 0.9568627477, green: 0.8078432088, blue: 0.07843137532, alpha: 1))
    
}


struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.gray, lineWidth: 3)
        ).padding()
    }
}


struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    ZStack {
      configuration.label
      Spacer()
      Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
        .resizable()
        .frame(width:24, height: 24)
        .foregroundColor(.primaryColor1)
        .onTapGesture { configuration.isOn.toggle() }
    }
  }
}
