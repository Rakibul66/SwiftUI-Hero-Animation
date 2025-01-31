import SwiftUI

struct GridItemView: View {
    var hero: Hero
    var namespace: Namespace.ID
    var isHidden: Bool

    var body: some View {
        VStack {
            if !isHidden { // Hide the icon when it's in detail view
                Image(systemName: hero.icon)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "\(hero.id)_icon", in: namespace, isSource: true)
            }
            Text(hero.title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(hero.color)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
