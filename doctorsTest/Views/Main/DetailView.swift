//
//  DetailView.swift
//  doctorsTest
//
//  Created by Сергей on 17.08.2024.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @Environment(\.dismiss) var presentationMode
    @EnvironmentObject var viewModel: MainViewModel
    let doctor: User
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.viewCalc
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        KFImage(viewModel.getImageUrl(user: doctor))
                            .resizable()
                            .placeholder({
                                Image(systemName: "person.circle")
                                    .resizable()
                            })
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(doctor.lastName)
                                .blackCustom()
                            Text((doctor.firstName) + " " + (doctor.patronymic))
                                .blackCustom()
                        }
                        Spacer()
                    }
                    VStack(spacing: 10) {
                        CustomInfo(imageName: "time", info: "Опыт работы: \(viewModel.getYearWord(user: doctor))")
                        CustomInfo(imageName: "bag", info: viewModel.getCategory(user: doctor))
                        CustomInfo(imageName: "cap", info: viewModel.getUniversity(user: doctor))
                        CustomInfo(imageName: "point", info: viewModel.getWorkPlace(user: doctor))
                    }
                    HStack {
                        Text("Стоимость услуг")
                            .blackCustom()
                        Spacer()
                        Text("От \(doctor.price) ₽")
                            .blackCustom()
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(8)
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                        .padding(.top)
                        .font(.system(size: 14))
                    Spacer()
                    
                    Button(action: {
                        //TODO
                    }, label: {
                        Text("Записаться")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                            .background(Color.pinkCalc)
                            .cornerRadius(8)
                    })
                }
                .padding()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(viewModel.getSpecialization(user: doctor))
                        .font(.title3)
                }
            }
            .navigationBarItems(leading: Button(action: {
                presentationMode.callAsFunction()
            }, label: {
                    Image(systemName: "chevron.backward")
                        .tint(Color.grayCalc)
            }))
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func CustomInfo(imageName: String, info: String) -> some View {
        HStack {
            Image(imageName)
            Text(info)
                .grayCustom()
            Spacer()
        }
    }
}

//#Preview {
//    DetailView(doctor:User(
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
