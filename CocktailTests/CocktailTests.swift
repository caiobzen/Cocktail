import Quick
import Nimble

@testable import Cocktail

//API: https://www.thecocktaildb.com/api.php

class CocktailTests: QuickSpec {
    override func spec() {
        describe(".Cocktail") {
            context("#init") {
                it("creates a Cocktail instance") {
                    let cocktail = Cocktail()
                    expect(cocktail).toNot(beNil())
                }
                
                it("has a fetching mechanism") {
                    let fetcher = Fetcher()
                    let cocktail = CocktailMock(with: fetcher)
                    expect(cocktail._fetcher).toNot(beNil())
                }
            }
        }
    }
}

class CocktailMock: Cocktail {
    var _fetcher: Fetcher? {
        return fetcher
    }
}
