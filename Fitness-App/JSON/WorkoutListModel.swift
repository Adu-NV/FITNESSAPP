/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct WorkoutListModel : Codable {
	let code : Int?
	let message : String?
	let data : WorkoutListData?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent(WorkoutListData.self, forKey: .data)
	}

}


struct WorkoutListData : Codable {
    let workout_day : Int?
    let workout_count : Int?
    let workout_schedule_id : String?
    let workout_list : [Workout_list]?

    enum CodingKeys: String, CodingKey {

        case workout_day = "workout_day"
        case workout_count = "workout_count"
        case workout_schedule_id = "workout_schedule_id"
        case workout_list = "workout_list"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        workout_day = try values.decodeIfPresent(Int.self, forKey: .workout_day)
        workout_count = try values.decodeIfPresent(Int.self, forKey: .workout_count)
        workout_schedule_id = try values.decodeIfPresent(String.self, forKey: .workout_schedule_id)
        workout_list = try values.decodeIfPresent([Workout_list].self, forKey: .workout_list)
    }

}


struct Workout_list : Codable {
    let workout_id : String?
    let workout_name : String?
    let workout_type_id : String?
    let workout_type : String?
    let workout_is_time : Int?
    let workout_repetition : Int?
    let workout_set : Int?
    let workout_rest : Int?
    let workout_done : Bool?
    let workout_image : String?

    enum CodingKeys: String, CodingKey {

        case workout_id = "workout_id"
        case workout_name = "workout_name"
        case workout_type_id = "workout_type_id"
        case workout_type = "workout_type"
        case workout_is_time = "workout_is_time"
        case workout_repetition = "workout_repetition"
        case workout_set = "workout_set"
        case workout_rest = "workout_rest"
        case workout_done = "workout_done"
        case workout_image = "workout_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        workout_id = try values.decodeIfPresent(String.self, forKey: .workout_id)
        workout_name = try values.decodeIfPresent(String.self, forKey: .workout_name)
        workout_type_id = try values.decodeIfPresent(String.self, forKey: .workout_type_id)
        workout_type = try values.decodeIfPresent(String.self, forKey: .workout_type)
        workout_is_time = try values.decodeIfPresent(Int.self, forKey: .workout_is_time)
        workout_repetition = try values.decodeIfPresent(Int.self, forKey: .workout_repetition)
        workout_set = try values.decodeIfPresent(Int.self, forKey: .workout_set)
        workout_rest = try values.decodeIfPresent(Int.self, forKey: .workout_rest)
        workout_done = try values.decodeIfPresent(Bool.self, forKey: .workout_done)
        workout_image = try values.decodeIfPresent(String.self, forKey: .workout_image)
    }

}
