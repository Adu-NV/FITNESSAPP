/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TranscationHistoryModel : Codable {
	let code : Int?
	let message : String?
	let data : [TranscationHistoryData]?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent([TranscationHistoryData].self, forKey: .data)
	}

}

struct TranscationHistoryData : Codable {
    let package : String?
    let level : String?
    let purchase_date : String?
    let start_date : String?
    let end_date : String?
    let amount : String?
    let payment_id : String?
    let payment_type : String?

    enum CodingKeys: String, CodingKey {

        case package = "package"
        case level = "level"
        case purchase_date = "purchase_date"
        case start_date = "start_date"
        case end_date = "end_date"
        case amount = "amount"
        case payment_id = "payment_id"
        case payment_type = "payment_type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package = try values.decodeIfPresent(String.self, forKey: .package)
        level = try values.decodeIfPresent(String.self, forKey: .level)
        purchase_date = try values.decodeIfPresent(String.self, forKey: .purchase_date)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        amount = try values.decodeIfPresent(String.self, forKey: .amount)
        payment_id = try values.decodeIfPresent(String.self, forKey: .payment_id)
        payment_type = try values.decodeIfPresent(String.self, forKey: .payment_type)
    }

}
