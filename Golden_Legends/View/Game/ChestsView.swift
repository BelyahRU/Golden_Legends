import SwiftUI

struct ChestsView: View {
    @State private var selectedIndex: Int? = nil

    let chestNames = ["chest1", "chest2", "chest3"]
    let chestSelectedNames = ["chest1Selected", "chest2Selected", "chest3Selected"]

    var onChestSelected: (Int) -> Void

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("baseBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Image("chooseYourTreasureLabel")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 275)
                    .position(CGPoint(x: proxy.size.width / 2, y: 140))
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        ForEach(0..<3, id: \.self) { row in
                            HStack(spacing: 15) {
                                ForEach(0..<3, id: \.self) { col in
                                    let chestIndex = col
                                    let index = row * 3 + col
                                    Button {
                                        selectedIndex = selectedIndex == index ? nil : index
                                    } label: {
                                        Image(selectedIndex == index ? chestSelectedNames[chestIndex] : chestNames[chestIndex])
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
                    
                    Button {
                        if let selected = selectedIndex {
                            onChestSelected(selected)
                        }
                    } label: {
                        Image("openButton")
                            .resizable()
                            .frame(width: 239, height: 117)
                    }
                    .padding(.bottom, proxy.size.height > 750 ? 120 : 65)
                }
            }
            
        }
    }
}
