import SwiftUI

struct DetailView: View {
    var hero: Hero
    var namespace: Namespace.ID
    var dismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            // Top 30% Color Background
            ZStack {
                hero.color
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                
                // Center Title & Icon
                VStack {
                    Image(systemName: hero.icon)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: "\(hero.id)_icon", in: namespace, isSource: false) // Set isSource: false
                        .padding(5)
                    Text(hero.title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
            }

            // Detail Information
            VStack(alignment: .leading, spacing: 10) {
                Text("Overview")
                    .font(.headline)
                Text(hero.detail)
                    .foregroundColor(.gray)

                Divider()

                Text("Features")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 5) {
                    FeatureRow(text: "🔥 Fast Performance")
                    FeatureRow(text: "📱 Cross-Platform Support")
                    FeatureRow(text: "🎨 Beautiful UI")
                }
            }
            .padding()

            Spacer()
        }
        .overlay(
            Button(action: {
                withAnimation(.spring()) {
                    dismiss()
                }
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        )
    }
}

// Helper for corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// Feature Row
struct FeatureRow: View {
    var text: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            Text(text)
                .foregroundColor(.black)
        }
    }
}
