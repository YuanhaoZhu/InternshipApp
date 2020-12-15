//
//  NetworkManager.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/14/20.
//

import Foundation
import Alamofire

class NetworkManager {

    // TODO: Edit our server host endpoint
    /* Helpful Hint: What is the host endpoint for our server?
     * Ex. If endpoint is "https://google.com/blah", Google is the host
     */
    private static let host = "https://cs1998internapp.herokuapp.com"
    
    
    static func getStudents(completion: @escaping ([Student]) -> Void) {
        let endpoint = "\(host)/api/employees/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodeAndPrint = { print(try! jsonDecoder.decode(StudentDataResponse.self, from: data)) }
                decodeAndPrint()
                if let studentsData = try? jsonDecoder.decode(StudentDataResponse.self, from: data) {
                    // Instructions: Use completion to handle response
                    let students = studentsData.data
                    completion(students)
                }
                else {
                    print("hehe")
                    print(data)
                }
            case .failure(let error):
                print(error.localizedDescription)

            }

        }
    }
    
    static func getSingleStudent(id: Int, completion: @escaping (Student) -> Void) {
        let parameters: [String: Any] = [
            "id": id
        ]
        let endpoint = "\(host)/api/employees/"
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let student = try? jsonDecoder.decode(Student.self, from: data) {
                    // Instructions: Use completion to handle response
                    let student = student
                    completion(student)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // EXTRA CREDIT TODO: Complete function to search for restaurants
    static func searchStudents(name: String, completion: @escaping ([Student]) -> Void) {
        let endpoint = "\(host)/employees/search?name=\(name)"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let studentsData = try? jsonDecoder.decode(StudentDataResponse.self, from: data) {
                    // Instructions: Use completion to handle response
                    let students = studentsData.data
                    completion(students)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

