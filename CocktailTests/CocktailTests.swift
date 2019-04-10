import Quick
import Nimble

@testable import Cocktail

class CocktailTests: QuickSpec {
    override func spec() {
        describe(".Cocktail") {
            context("#init") {
                it("creates a Cocktail instance") {
                    let cocktail = Cocktail()
                    expect(cocktail).toNot(beNil())
                }
            }
        }
    }
}
