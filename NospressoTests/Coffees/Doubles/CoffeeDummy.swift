@testable import Nospresso
import Foundation

extension CapsulesResponse {
    
    static func dummy() -> CapsulesResponse {
        return .init(capsules: [
            Capsules(
                category: "Edição Limitada",
                coffees:
                    [Coffee(
                        id: 1,
                        name: "Hawaii Kona",
                        description: "CAFÉ FRUTADO, EQUILIBRADO E RARO",
                        intensity: 5,
                        unitValue: 6,
                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/13334877011998/Desktop-Standard-80x80.png",
                        measurements: ["espresso"]
                    ),
                     Coffee(
                        id: 2,
                        name: "Aged Sumatra",
                        description: "CAFÉ ARTESANAL, APRIMORADO PELO TEMPO",
                        intensity: 7,
                        unitValue: 4,
                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/13415712784414/C-0625-Responsive-Standard-80x80.png",
                        measurements: ["espresso",
                                       "lungo"]
                     )
                    ]
            ),
            Capsules(
                category: "Master Origin",
                coffees:
                    [Coffee(
                        id: 3,
                        name: "India",
                        description: "CAFÉ COM ROBUSTA DE MONÇÕES",
                        intensity: 11,
                        unitValue: 2.8,
                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/10840367792158/C-0359-India-80x80.png",
                        measurements: ["espresso",
                                       "lungo"]
                    ),
                     Coffee(
                        id: 4,
                        name: "Indonesia",
                        description: "CAFÉ COM ARÁBICA NO MÉTODO DE DESCASCAMENTO ÚMIDO",
                        intensity: 8,
                        unitValue: 2.8,
                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/10820727865374/C-0360-Indonesia-80x80.png",
                        measurements: ["espresso",
                                       "lungo"]
                     ),
                     Coffee(
                        id: 5,
                        name: "Colombia",
                        description: "CAFÉ COM ARÁBICA DE COLHEITA TARDIA",
                        intensity: 6,
                        unitValue: 2.8,
                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/10842190675998.png",
                        measurements: ["espresso",
                                       "lungo"]
                     ),
                     Coffee(
                        id: 6,
                        name: "Nicaragua",
                        description: "CAFÉ COM ARÁBICA \"BLACK-HONEY\"",
                        intensity: 5,
                        unitValue: 2.8,
                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/10838071672862/C-0362-nicaragua-80x80.png",
                        measurements: ["espresso",
                                       "lungo"]
                     ),
                     Coffee(
                        id: 7,
                        name: "Ethiopia",
                        description: "CAFÉ COM ARÁBICA DE SECAGEM NATURAL",
                        intensity: 4,
                        unitValue: 2.8,
                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/10831332802590/C-0363-Ethiopia-80x80.png",
                        measurements: ["espresso",
                                       "lungo"]
                     )
                    ]
            )
        ]
        )
    }
}
