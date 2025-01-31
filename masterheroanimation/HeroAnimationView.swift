import SwiftUI

struct HeroAnimationView: View {
    @StateObject var viewModel = HeroViewModel()
    @Namespace private var animationNamespace
    @State private var selectedHero: Hero?

    var body: some View {
        ZStack {
            if selectedHero == nil {
                NavigationStack {
                    GridView()
                        .navigationTitle("Heroes")
                }
            }

            if let hero = selectedHero {
                DetailView(hero: hero, namespace: animationNamespace) {
                    withAnimation(.spring()) {
                        selectedHero = nil
                    }
                }
                .zIndex(1) // Make sure DetailView is on top
            }
        }
    }

    @ViewBuilder
    func GridView() -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            ForEach(viewModel.heroes) { hero in
                Button(action: {
                    withAnimation(.spring()) {
                        selectedHero = hero
                    }
                }) {
                    GridItemView(hero: hero, namespace: animationNamespace, isHidden: selectedHero == hero)
                }
            }
        }
        .padding()
    }

}
