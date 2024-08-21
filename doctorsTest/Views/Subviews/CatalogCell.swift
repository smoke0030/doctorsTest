//
//  CatalogCell.swift
//  doctorsTest
//
//  Created by Сергей on 16.08.2024.
//

import SwiftUI
import Kingfisher

struct CatalogCell: View {
    let user: User
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                KFImage(viewModel.getImageUrl(user: user))
                    .resizable()
                    .placeholder({
                        Image(systemName: "person.circle")
                            .resizable()
                    })
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(user.lastName)
                        .blackCustom()
                    Text((user.firstName) + " " + (user.patronymic))
                        .blackCustom()
                    
                    HStack {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(Int(user.rating) >= index ? Color.pinkCalc : .gray)
                        }
                    }
                    
                    HStack {
                        Text(viewModel.getSpecialization(user: user))
                            .grayCustom()
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 5, height: 5)
                        Text("стаж \(viewModel.getYearWord(user: user))")
                            .grayCustom()
                    }
                    
                    Text("от \(user.price) ₽")
                        .blackCustom()
                    
                }
                Spacer()
                Button(action: {
                    print("Favourite")
                }, label: {
                    Image(systemName: "heart")
                        .foregroundStyle(.gray)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.top)
            
            Button(action: {
                print("Записаться")
            }, label: {
                Text("Записаться")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                    .background(Color.pinkCalc)
                    .cornerRadius(8)
                    .padding(.top, 15)
            })
            .buttonStyle(PlainButtonStyle())
        }
        .cornerRadius(8)
        
    }
}

//#Preview {
//    CatalogCell(user: User(
//        id: "1",
//        firstName: "Кирилл",
//        patronymic: "Александрович",
//        lastName: "Осташков",
//        textChatPrice: 600,
//        avatar: "",
//        ratingsRating: 3,
//        educationTypeLabel: "1-й ММИ им И.М.Сеченова",
//        scientificDegreeLabel: "Врач высшей категории"
//    ))
//}
