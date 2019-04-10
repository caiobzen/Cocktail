@testable import Cocktail

class FetcherMock: Fetcher {
    var didCallFetch = false
    var shouldFail = false
    
    var lastEndpoint: Endpoint!
    
    func reset() {
        didCallFetch = false
        shouldFail = false
    }
    
    override func fetch(_ endpoint: Endpoint, completion: (Codable) -> Void) {
        lastEndpoint = endpoint
        if shouldFail {
            let error = ResponseError()
            completion(error)
        } else {
            let response = CocktailResponse(cocktails: [])
            completion(response)
        }
        didCallFetch = true
    }
}
