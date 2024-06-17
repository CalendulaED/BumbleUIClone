//
//  BumbleFilterView.swift
//  BumbleClone
//
//  Created by Yuxuan Wu on 6/5/24.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options: [String] = ["Everyone", "Trending"]
    @Binding var selection: String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreview: View {
    
    var options: [String] = ["Everyone", "Trending", "Your Fav"]
    @State private var selection = "Everyone"
    
    var body: some View {
        BumbleFilterView(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
}
