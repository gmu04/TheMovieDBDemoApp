// ApiError.swift by Gokhan Mutlu on 31.03.2022

import Foundation

enum ApiError: Error{
	case any(String)
	case anyError(Error)
	case jsonParsing(String)
	case statusCodeNot200(String)
}
