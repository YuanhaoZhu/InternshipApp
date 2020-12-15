
import Foundation

struct Response <T: Codable>: Codable {
    let data: T
    let success: Bool
}

// TODO: Define model for our restaurant resposne
struct StudentDataResponse: Codable {
    /* Instructions: Take a look at the JSON response we get from our HTTP Requests.
     * Model your RestaurantsDataResponse object after the JSON response.
     */
    var studentList: [Student]
}

// TODO: Define model for our restaurant
struct Student: Codable {
    /* Instructions: Take a look at the JSON response we get from our HTTP Requests.
     * Model your Restaurant object after the JSON response, except using camel
     * case instead of snake case, as shown in our JSON response.
     * Helpful Hint: We have two different possible restaurant objects we might get
     * back from the backend, one with "reviews" and one without. How do we include
     * this in our model despite this being the case? Think about what we do when
     * a value is allowed to be nil...
     */
    
    let id: Int
    let name: String
    let location: String
    let picture: String
    let gpa: Float
    let pastWorkExperience: String
    let startMonth: String
    let endMonth: String
    let jobAccepted: String
    let preferredPosition:[String]?
    let email: String
    

    
}
