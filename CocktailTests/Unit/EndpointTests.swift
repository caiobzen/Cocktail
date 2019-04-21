import Quick
import Nimble

@testable import Cocktail

class EndpointTests: QuickSpec {
    override func spec() {
        describe(".Endpoint") {
            context("#url") {
                it("creates an url with the expected baseUrl, path and params") {
                    let endpoint = Endpoint(path: "test/", param: "test2")
                    
                    expect(endpoint.url).to(equal(URL(string: "https://www.thecocktaildb.com/api/json/v1/1/test/test2")))
                }
            }
        }
    }
}
