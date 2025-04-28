import Foundation

class MovieManager {
    static let shared = MovieManager()

    private init() {}

    let movies: [Movie] = [
        Movie(
            title: "Star Wars: The Last Jedi",
            logo: "starlogo",
            description: "Rey trains with Luke Skywalker to understand her growing powers while the Resistance faces escalating threats from the First Order. As secrets are uncovered, difficult choices determine the fate of both the Jedi and the galaxy itself.",
            images: ["star1", "star2" , "star3"],
            rating: 4.4,
            price: 500,
            trailerLink:  "https://youtu.be/Q0CbN8sfihY?si=pIsLGWA1uYQzq_48"
        ),
        
        Movie(
            title: "Inception",
            logo: "inceptionlogo",
            description: "Dom Cobb is a skilled thief who steals secrets through dream invasion. Offered a chance at redemption, he must perform inception—planting an idea into someone’s mind—while navigating a dangerous maze of shifting dreams and fractured realities.",
            images: ["inception1", "inception2"],
            rating: 3.8,
            price: 450,
            trailerLink: "https://youtu.be/YoHD9XEInc0?si=nMt_W-Z5jb9NZPIr"
        ),
        
        Movie(
            title: "Interstellar",
            logo: "interstellarlogo",
            description: "In a dying world, a team of explorers travels through a wormhole to find a new planet for humanity. Facing time distortion and emotional sacrifice, they fight to secure a future for the next generation back on Earth.",
            images: ["interstellar1", "interstellar2" , "interstellar3"],
            rating: 4.1,
            price: 750,
            trailerLink: "https://youtu.be/Lm8p5rlrSkY?si=gRyIOCt64JfpWiSq"
        ),
        
        Movie(
            title: "The Dark Knight",
            logo: "darklogo",
            description: "As Gotham descends into chaos, Batman faces off against the Joker, a ruthless criminal mastermind. With intense action and moral dilemmas, the hero must confront his limits and redefine what justice means in a corrupt city.",
            images: ["darkknight1", "darkknight2"],
            rating: 4.8,
            price: 600,
            trailerLink: "https://youtu.be/EXeTwQWrcwY?si=s6_pm4GQydh4hCfA"
        ),
        
    ]
}
