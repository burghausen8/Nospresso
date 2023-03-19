@testable import Nospresso
import Foundation

extension AccessoriesResponse {
    
    static func dummy() -> AccessoriesResponse {
        return .init(accessories: [Acessories(category: "Xícaras e Copos",
                                              items: [Item(id: 1,
                                                           name: "Xícaras ORIGINS Espresso",
                                                           description: "As xícaras da coleção Origins são feitas de porcelana com camada dupla, desenhadas pela renomada designer internacional India Mahdavi. A sua forma é inspirada num grão de café, com o exterior branco fosco e um interior colorido envernizado.",
                                                           unitValue: 115,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/11971285319710/A-0394-2000.png"
                                                          ),
                                                      Item(id: 2,
                                                           name: "Xícaras ORIGINS Lungo",
                                                           description: "Para momentos com café que te fazem voltar no tempo. Este conjunto de xícaras de café Lungo (ca. 180ml) transforma cada momento de café em um pequeno ritual.",
                                                           unitValue: 115,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/11904441974814/A-0395-2000.png"
                                                          ),
                                                      Item(id: 3,
                                                           name: "Xícaras PIXIE Espresso",
                                                           description: "Reinvente a forma de degustar seu café favorito com estas inovadoras xícaras de café criadas pelo audacioso grupo de designers franceses 5.5 Designers utilizando as cápsulas de café Nespresso como elemento central.",
                                                           unitValue: 110,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/13087862063134/Desktop-Standard-2000x2000.png"
                                                          ),
                                                      Item(id: 4,
                                                           name: "Xícaras PIXIE Lungo",
                                                           description: "Reinvente a forma de degustar seu café favorito com estas inovadoras xícaras de café criadas pelo audacioso grupo de designers franceses 5.5 Designers utilizando as cápsulas de café Nespresso como elemento central.",
                                                           unitValue: 120,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/13088013582366/Desktop-Standard-2000x2000.png"
                                                          )
                                              ]
                                             ),
                                   Acessories(category: "Para Harmonizar",
                                              items: [Item(id: 14,
                                                           name: "Chocolate Ao Leite",
                                                           description: "Preparado com leite suíço e 41% de cacau, o Chocolate Ao Leite Nespresso possui textura cremosa e derrete na boca revelando notas carameladas, que harmonizam perfeitamente com os deliciosos cafés Nespresso.",
                                                           unitValue: 40,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/10386876530718/A-0228-2000x2000.png"
                                                          ),
                                                      Item(id: 15,
                                                           name: "Chocolate Amargo",
                                                           description: "Preparado com leite suíço e 70% de cacau, o Chocolate Amargo Nespresso possui textura leve e sabor persistente, com notas frutadas e tostadas que despertam o paladar e harmonizam perfeitamente com os deliciosos cafés Nespresso.",
                                                           unitValue: 40,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/10386876334110/A-0227-2000x2000.png"
                                                          )
                                              ]
                                             ),
                                   Acessories(category: "Porta Cápsulas",
                                              items: [Item(id: 19,
                                                           name: "Nomad",
                                                           description: nil,
                                                           unitValue: 110,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/10567495548958/A-0381-Touch-nomad-dispenser-Gabarit-Accessories-2000x2000.png"
                                                          ),
                                                      Item(id: 20,
                                                           name: "Cube",
                                                           description: nil,
                                                           unitValue: 80,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/10386867421214/A-0042-2000x2000.png"
                                                          ),
                                                      Item(id: 21,
                                                           name: "Versilo",
                                                           description: nil,
                                                           unitValue: 170,
                                                           image: "https://www.nespresso.com/ecom/medias/sys_master/public/10386878496798/A-0265-2000x2000.png"
                                                          )
                                              ]
                                             )
        ])
    }
}
