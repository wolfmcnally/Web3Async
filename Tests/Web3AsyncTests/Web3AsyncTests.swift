import XCTest
import Web3
@testable import Web3Async

final class Web3AsyncTests: XCTestCase {
    static let infuraUrl = "https://mainnet.infura.io/v3/362c324f295a4032b2fe87d910aaa33a"
    let web3 = Web3(rpcURL: Web3AsyncTests.infuraUrl)
    
    func testClientVersion() async throws {
        let result = try await web3.clientVersion
        XCTAssert(!result.isEmpty) // E.g.: Geth/v1.10.8-omnibus-aef5bfb3/linux-amd64/go1.16.7
    }
    
    func testNetVersion() async throws {
        let result = try await web3.net.version
        XCTAssertEqual(result, "1") // mainnet chain id
    }
    
    func testNetPeerCount() async throws {
        let result = try await web3.net.peerCount
        XCTAssert(!result.quantity.isZero) // E.g.: 100
    }
    
    func testEthProtocolVersion() async throws {
        let result = try await web3.eth.protocolVersion
        XCTAssert(!result.isEmpty) // E.g.: 0x41
    }
}
