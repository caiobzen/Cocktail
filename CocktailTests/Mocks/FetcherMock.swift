@testable import Cocktail

class FetcherMock: Fetcher {
    var didCallFetch = false
    var shouldFail = false
    
    var lastEndpoint: Endpoint?
    
    func reset() {
        didCallFetch = false
        shouldFail = false
        lastEndpoint = nil
    }
    
    var successResponse: Data {
        let testBundle = Bundle(for: type(of: self))
        let jsonUrl = testBundle.url(forResource: "margherita", withExtension: "json")!
        let data = try! Data(contentsOf: jsonUrl)
        return data
    }
    
    var errorResponse: Data {
        let testBundle = Bundle(for: type(of: self))
        let jsonUrl = testBundle.url(forResource: "error", withExtension: "json")!
        let data = try! Data(contentsOf: jsonUrl)
        return data
    }
    
    override func fetch(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        didCallFetch = true
        lastEndpoint = endpoint
        if shouldFail {
            completion(.failure(MockError()))
        } else {
            completion(.success(successResponse))
        }
    }
}

class MockError: Error {
    
}
