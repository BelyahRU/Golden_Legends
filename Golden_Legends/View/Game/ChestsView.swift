import SwiftUI

//MARK: - View with 9 chests
struct ChestsView: View {
    @ObservedObject var interactor = ChestInteractor()
    var onChestSelected: (Int) -> Void

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("baseBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                //label
                Image("chooseYourTreasureLabel")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 275)
                    .position(CGPoint(x: proxy.size.width / 2, y: 140))

                //chests
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        ForEach(0..<3, id: \.self) { row in
                            HStack(spacing: 15) {
                                ForEach(0..<3, id: \.self) { col in
                                    let chestIndex = col
                                    let index = row * 3 + col
                                    Button {
                                        AudioManager.shared.playButtonEffect()
                                        interactor.select(index: index)
                                    } label: {
                                        Image(interactor.selectedIndex == index ? "chest\(chestIndex + 1)Selected" : "chest\(chestIndex + 1)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 95)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, -120)

                    Spacer()

                    //opening
                    Button {
                        AudioManager.shared.playButtonEffect()
                        if let selected = interactor.selectedIndex {
                            onChestSelected(selected)
                        }
                    } label: {
                        Image("openButton")
                            .resizable()
                            .frame(width: 239, height: 117)
                    }
                    .padding(.bottom, proxy.size.height > 750 ? 120 : 70)
                }
            }
        }
    }
}
