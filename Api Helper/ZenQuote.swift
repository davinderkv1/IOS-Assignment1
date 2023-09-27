struct ZenQuote: Codable {
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case text = "q"
    }
}
