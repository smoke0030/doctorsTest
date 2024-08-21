//
//  Model.swift
//  doctorsTest
//
//  Created by Сергей on 16.08.2024.
//

import Foundation


struct Response: Codable {
  let data: UserData
}

struct UserData: Codable {
    let users: [User]
}

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let patronymic: String
    let rating: Double
    let avatar: String?
    let price: Int
    let category: Int
    let specialization: [Specialization]
    let higherEducation: [Institution]
    let workExpirience: [WorkExperience]
    let freeReceptionTime: [FreeReceptionTime]
    
    enum CodingKeys: String, CodingKey {
        case id, patronymic
        case firstName = "first_name"
        case lastName = "last_name"
        case rating = "ratings_rating"
        case avatar
        case price = "video_chat_price"
        case category = "category"
        case specialization
        case higherEducation = "higher_education"
        case workExpirience = "work_expirience"
        case freeReceptionTime = "free_reception_time"
        
    }
   }

struct Specialization: Codable {
    let id: Int
    let name: String
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case isModerated = "is_moderated"
    }
}

struct FreeReceptionTime: Codable {
    let time: Int
}

struct Institution: Codable {
    let id: Int
    let university: String
    let specialization: String
    let qualification: String
    let startDate: Int
    let endDate: Int
    let untilNow: Bool
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, university, specialization, qualification
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
        case isModerated = "is_moderated"
    }
}

struct WorkExperience: Codable {
    let id: Int
    let organization: String
    let position: String
    let startDate: Int
    let endDate: Int?
    let untilNow: Bool
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
        case isModerated = "is_moderated"
    }
}
