//
//  HashResponseModel.swift
//  Fitness-App
//
//  Created by Netventure on 21/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
struct HashResponseModel : Codable {
    let code : Int?
    let message : String?
    let data : HashResponseData?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(HashResponseData.self, forKey: .data)
    }
}

struct HashResponseData : Codable {
    let hash : String?

    enum CodingKeys: String, CodingKey {
        case hash = "hash"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hash = try values.decodeIfPresent(String.self, forKey: .hash)
    }
}
