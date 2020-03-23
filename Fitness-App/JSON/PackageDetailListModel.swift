/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct PackageDetailListModel : Codable {
	let code : Int?
	let message : String?
	let data : PackageDetailListData?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent(PackageDetailListData.self, forKey: .data)
	}

}


struct PackageDetailListData : Codable {
    let package_id : String?
    let package_name : String?
    let package_desc : String?
    let package_fee : String?
    let package_validity : Int?
    let package_pt_available : Int?
    let package_pt_days : Int?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case package_name = "package_name"
        case package_desc = "package_desc"
        case package_fee = "package_fee"
        case package_validity = "package_validity"
        case package_pt_available = "package_pt_available"
        case package_pt_days = "package_pt_days"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(String.self, forKey: .package_id)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        package_desc = try values.decodeIfPresent(String.self, forKey: .package_desc)
        package_fee = try values.decodeIfPresent(String.self, forKey: .package_fee)
        package_validity = try values.decodeIfPresent(Int.self, forKey: .package_validity)
        package_pt_available = try values.decodeIfPresent(Int.self, forKey: .package_pt_available)
        package_pt_days = try values.decodeIfPresent(Int.self, forKey: .package_pt_days)
    }

}
