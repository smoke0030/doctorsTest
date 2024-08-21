//
//  ViewModel.swift
//  doctorsTest
//
//  Created by Сергей on 16.08.2024.
//

import Foundation
import Kingfisher

final class MainViewModel: ObservableObject {
    
    @Published var doctors: [User] = []
    
    func getObjects() {
        NetworkService.shared.fetchData { result in
            switch result {
            case .success(let object):
                self.doctors = object.data.users
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getImageUrl(user: User)  -> URL? {
        guard let url = URL(string: user.avatar ?? "") else { return nil }
        return url
    }
    
    func getCategory(user: User) -> String {
        var category = ""
        switch user.category {
        case 1:
            category = "Врач второй категории"
        case 2:
            category = "Врач первой категории"
        case 3:
            category = "Врач высшей категории"
        default:
            category = "Категория не указана"
        }
        return category
    }
    
    func getSpecialization(user: User) -> String {
        return user.specialization.first?.name ?? "Не указано"
    }
    
    func getUniversity(user: User) -> String {
        guard let university = user.higherEducation.first?.university else { return "Не указан" }
        return university
    }
    
    func getWorkPlace(user: User) -> String {
        guard let place = user.workExpirience.first?.organization else { return "Не указано"}
        return place
    }
    
    func getWorkExp(user: User) -> Int {
        var date = 0
        if let startDateTime = user.workExpirience.first?.startDate, user.workExpirience.first?.untilNow == true {
            
            let currentDate = Date()
            let interval = currentDate.timeIntervalSince1970
            date = Date.getYearsFromUnix(startDate: Double(startDateTime), endDate: interval)
        } else if let startDateTime = user.workExpirience.first?.startDate, let endDateTime = user.workExpirience.first?.endDate {
            date = Date.getYearsFromUnix(startDate: Double(startDateTime), endDate: Double(endDateTime))
        }
        return date
    }
    
    func getYearWord(user: User) -> String {
        
        let year = getWorkExp(user: user)
        let lastDigit = year % 10
        let lastTwoDigits = year % 100
        
        switch lastDigit {
        case 1 where lastTwoDigits != 11:
            return "\(year) год"
        case 2, 3, 4:
            return "\(year) года"
        default:
            return ("\(year) лет")
        }
    }
}
