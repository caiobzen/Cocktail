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
    
    override func fetch(_ endpoint: Endpoint, completion: (Codable) -> Void) {
        didCallFetch = true
        lastEndpoint = endpoint
        
        let response: Codable = shouldFail ? ResponseError() : CocktailResponse(cocktails: [])
        completion(response)
    }
}
