//
//  ErrorMessage.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/6/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

enum ErrorMessage: Error {
    case networkError(String)
    case invalidResponse(String)
    case badUrl(String)
    case unableToDecode(String)
}
