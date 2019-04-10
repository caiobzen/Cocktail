@testable import Cocktail

class FetcherMock: Fetcher {
    var didCallFetch = false
    
    override func fetch() {
        super.fetch()
        didCallFetch = true
    }
}
