/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct PackageListModel : Codable {
	let code : Int?
	let message : String?
	let data : PackageListData?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent(PackageListData.self, forKey: .data)
	}

}

struct PackageListData : Codable {
    let active_present : Bool?
    let active : PackageListActive?
    let latest : PackageListLatest?
    let user : PackageListUser?
    let packages : [PackageList]?

    enum CodingKeys: String, CodingKey {

        case active_present = "active_present"
        case active = "active"
        case latest = "latest"
        case user = "user"
        case packages = "packages"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        active_present = try values.decodeIfPresent(Bool.self, forKey: .active_present)
        active = try values.decodeIfPresent(PackageListActive.self, forKey: .active)
        latest = try values.decodeIfPresent(PackageListLatest.self, forKey: .latest)
        user = try values.decodeIfPresent(PackageListUser.self, forKey: .user)
        packages = try values.decodeIfPresent([PackageList].self, forKey: .packages)
    }

}

struct PackageListActive : Codable {
    let package_id : String?
    let package_name : String?
    let package_desc : String?
    let package_validity : Int?
    let package_amount : String?
    let package_start_date : String?
    let package_end_date : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case package_name = "package_name"
        case package_desc = "package_desc"
        case package_validity = "package_validity"
        case package_amount = "package_amount"
        case package_start_date = "package_start_date"
        case package_end_date = "package_end_date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(String.self, forKey: .package_id)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        package_desc = try values.decodeIfPresent(String.self, forKey: .package_desc)
        package_validity = try values.decodeIfPresent(Int.self, forKey: .package_validity)
        package_amount = try values.decodeIfPresent(String.self, forKey: .package_amount)
        package_start_date = try values.decodeIfPresent(String.self, forKey: .package_start_date)
        package_end_date = try values.decodeIfPresent(String.self, forKey: .package_end_date)
    }

}

struct PackageListLatest : Codable {
    let package_id : String?
    let package_name : String?
    let package_desc : String?
    let package_validity : Int?
    let package_amount : String?
    let package_start_date : String?
    let package_end_date : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case package_name = "package_name"
        case package_desc = "package_desc"
        case package_validity = "package_validity"
        case package_amount = "package_amount"
        case package_start_date = "package_start_date"
        case package_end_date = "package_end_date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(String.self, forKey: .package_id)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        package_desc = try values.decodeIfPresent(String.self, forKey: .package_desc)
        package_validity = try values.decodeIfPresent(Int.self, forKey: .package_validity)
        package_amount = try values.decodeIfPresent(String.self, forKey: .package_amount)
        package_start_date = try values.decodeIfPresent(String.self, forKey: .package_start_date)
        package_end_date = try values.decodeIfPresent(String.self, forKey: .package_end_date)
    }

}

struct PackageList : Codable {
    let package_id : String?
    let package_name : String?
    let package_desc : String?
    let package_validity : Int?
    let package_amount : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case package_name = "package_name"
        case package_desc = "package_desc"
        case package_validity = "package_validity"
        case package_amount = "package_amount"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(String.self, forKey: .package_id)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        package_desc = try values.decodeIfPresent(String.self, forKey: .package_desc)
        package_validity = try values.decodeIfPresent(Int.self, forKey: .package_validity)
        package_amount = try values.decodeIfPresent(String.self, forKey: .package_amount)
    }

}

struct PackageListUser : Codable {
    let phone : String?
    let name : String?
    let email : String?

    enum CodingKeys: String, CodingKey {

        case phone = "phone"
        case name = "name"
        case email = "email"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }

}
