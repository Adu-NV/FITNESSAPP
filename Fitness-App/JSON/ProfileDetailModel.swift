/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ProfileDetailModel : Codable {
	let code : Int?
	let message : String?
	let data : ProfileDetailData?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent(ProfileDetailData.self, forKey: .data)
	}

}


struct ProfileDetailData : Codable {
    let member_id : Int?
    let name : String?
    let gender : String?
    let email : String?
    let phone : String?
    let address : String?
    let date_of_birth : String?
    let starting_weight : String?
    let starting_body_fat : String?
    let starting_date : String?
    let review_date : String?
    let goal : String?
    let profile_picture : String?

    enum CodingKeys: String, CodingKey {

        case member_id = "member_id"
        case name = "name"
        case gender = "gender"
        case email = "email"
        case phone = "phone"
        case address = "address"
        case date_of_birth = "date_of_birth"
        case starting_weight = "starting_weight"
        case starting_body_fat = "starting_body_fat"
        case starting_date = "starting_date"
        case review_date = "review_date"
        case goal = "goal"
        case profile_picture = "profile_picture"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        member_id = try values.decodeIfPresent(Int.self, forKey: .member_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        date_of_birth = try values.decodeIfPresent(String.self, forKey: .date_of_birth)
        starting_weight = try values.decodeIfPresent(String.self, forKey: .starting_weight)
        starting_body_fat = try values.decodeIfPresent(String.self, forKey: .starting_body_fat)
        starting_date = try values.decodeIfPresent(String.self, forKey: .starting_date)
        review_date = try values.decodeIfPresent(String.self, forKey: .review_date)
        goal = try values.decodeIfPresent(String.self, forKey: .goal)
        profile_picture = try values.decodeIfPresent(String.self, forKey: .profile_picture)
    }

}
