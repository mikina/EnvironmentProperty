import SwiftUI

struct ContentView: View {
    @State var acceptTerms: Bool = false
    @State var accepted = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Terms")
                .font(.title)

            Text("If you have any questions regarding these terms, you can read the legal text below by clicking the buttons below.\n\nBy clicking \"Accept Terms\", you agree to these terms.")

            Divider()
            Toggle("I accept the terms", isOn: $acceptTerms)
            Divider()

            HStack(alignment: .center) {
                Button("Accept") {
                    accepted = true
                }
                .disabled(acceptTerms == false)

                MyButton(title: "Accept") {
                    accepted = true
                }
                .disabled(acceptTerms == false)

                MyButton(title: "Accept") {
                    accepted = true
                }
                .disabled(false)

            }
            .frame(maxWidth: .infinity)

            Spacer()

            ZStack {}
                .alert(isPresented: $accepted) {
                    Alert(
                        title: Text("Terms has been accepted"),
                        dismissButton: .cancel(Text("OK"))
                    )
                }
        }
        .padding()
    }
}

struct MyButton: View {
    @Environment(\.isEnabled) var isEnabled

    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(isEnabled ? .white : .gray)
                .padding()
                .background(
                    Capsule()
                        .fill(.orange)
                )
        }
        .opacity(isEnabled ? 1 : 0.5)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
