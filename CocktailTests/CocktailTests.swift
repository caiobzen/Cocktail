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
            
            context("#search") {
                context("for a cocktail name with success") {
                    it("returns a list of drinks") {
                        let fetcher = Fetcher()
                        let cocktail = CocktailMock(with: fetcher)
                        var results: [Any] = []
                        cocktail.search(byName: "margherita") { result in
                            results = result
                        }
                        expect(results).toNot(beEmpty())
                    }
                }
            }
        }
    }
}

class CocktailMock: Cocktail {
    var _fetcher: Fetcher? {
        return fetcher
    }
    
    override func search(byName: String, completion: @escaping ([Any]) -> Void) {
        completion([[:]])
    }
}
