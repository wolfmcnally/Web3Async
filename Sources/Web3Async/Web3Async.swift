import Foundation
import Web3

fileprivate func check<Result>(_ resp: Web3Response<Result>, _ continuation: CheckedContinuation<Result, Error>) {
    if let result = resp.result {
        continuation.resume(returning: result)
        return
    }
    if let error = resp.error {
        continuation.resume(throwing: error)
        return
    }
    continuation.resume(throwing: Web3AsyncError.unknownError)
}

public enum Web3AsyncError: Swift.Error {
    case unknownError
}

public extension Web3 {
    var clientVersion: String {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                clientVersion { resp in check(resp, continuation) }
            }
        }
    }
}

public extension Web3.Net {
    var version: String {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                version { resp in check(resp, continuation) }
            }
        }
    }
    
    var peerCount: EthereumQuantity {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                peerCount { resp in check(resp, continuation) }
            }
        }
    }
}

public extension Web3.Eth {
    var protocolVersion: String {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                protocolVersion { resp in check(resp, continuation) }
            }
        }
    }
}
