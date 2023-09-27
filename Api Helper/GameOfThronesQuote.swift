struct GameOfThronesQuote: Codable {
    struct CharacterInfo: Codable {
        let name: String
        let house: String
    }
    
    let character: CharacterInfo
    let quote: String
}
