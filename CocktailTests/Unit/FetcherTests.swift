import Quick
import Nimble

@testable import Cocktail

//API: https://www.thecocktaildb.com/api.php

class FetcherTests: QuickSpec {
    override func spec() {
        describe(".Fetcher") {
            context("#init") {
                it("has an instance of URLSession") {
                    let fetcher = Fetcher()
                    expect(fetcher.urlSession).toNot(beNil())
                }
            }
        }
        
    }
}
