/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct WorkoutDetailModel : Codable {
	let code : Int?
	let message : String?
	let data : WorkoutDetailData?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent(WorkoutDetailData.self, forKey: .data)
	}

}


struct WorkoutDetailData : Codable {
    let workout_id : String?
    let workout_name : String?
    let workout_desc : String?
    let workout_type_id : String?
    let workout_type : String?
    let workout_is_time : Int?
    let workout_repetition : Int?
    let workout_set : Int?
    let workout_rest : Int?
    let workout_muscles : [Workout_muscles]?
    let workout_image : String?
    let workout_video_code : String?
    let workout_done : Bool?

    enum CodingKeys: String, CodingKey {

        case workout_id = "workout_id"
        case workout_name = "workout_name"
        case workout_desc = "workout_desc"
        case workout_type_id = "workout_type_id"
        case workout_type = "workout_type"
        case workout_is_time = "workout_is_time"
        case workout_repetition = "workout_repetition"
        case workout_set = "workout_set"
        case workout_rest = "workout_rest"
        case workout_muscles = "workout_muscles"
        case workout_image = "workout_image"
        case workout_video_code = "workout_video_code"
        case workout_done = "workout_done"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        workout_id = try values.decodeIfPresent(String.self, forKey: .workout_id)
        workout_name = try values.decodeIfPresent(String.self, forKey: .workout_name)
        workout_desc = try values.decodeIfPresent(String.self, forKey: .workout_desc)
        workout_type_id = try values.decodeIfPresent(String.self, forKey: .workout_type_id)
        workout_type = try values.decodeIfPresent(String.self, forKey: .workout_type)
        workout_is_time = try values.decodeIfPresent(Int.self, forKey: .workout_is_time)
        workout_repetition = try values.decodeIfPresent(Int.self, forKey: .workout_repetition)
        workout_set = try values.decodeIfPresent(Int.self, forKey: .workout_set)
        workout_rest = try values.decodeIfPresent(Int.self, forKey: .workout_rest)
        workout_muscles = try values.decodeIfPresent([Workout_muscles].self, forKey: .workout_muscles)
        workout_image = try values.decodeIfPresent(String.self, forKey: .workout_image)
        workout_video_code = try values.decodeIfPresent(String.self, forKey: .workout_video_code)
        workout_done = try values.decodeIfPresent(Bool.self, forKey: .workout_done)
    }

}


struct Workout_muscles : Codable {
    let muscle_id : String?
    let muscle_name : String?

    enum CodingKeys: String, CodingKey {

        case muscle_id = "muscle_id"
        case muscle_name = "muscle_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        muscle_id = try values.decodeIfPresent(String.self, forKey: .muscle_id)
        muscle_name = try values.decodeIfPresent(String.self, forKey: .muscle_name)
    }

}
