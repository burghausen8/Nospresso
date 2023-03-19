@testable import Nospresso
import Foundation

extension MachinesResponse {
    
    static func dummy() -> MachinesResponse {
        return .init(machines: [Machine(id: 1,
                                        name: "Inissia",
                                        description: "Premiada por seu compacto design, a Inissia está aqui para garantir que a sua xícara de café seja prática, sem deixar nada fora do lugar.",
                                        unitValue: 499,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/13182854103070/Inissia-2000x2000.png"
                                       ),
                                Machine(id: 2,
                                        name: "Essenza Mini",
                                        description: "A Essenza Mini, com duas opções de modelo, é a menor cafeteira Nespresso e dá um toque de personalidade a todos os estilos e decorações.",
                                        unitValue: 549,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12197792874526/Essenza-preto.png"
                                       ),
                                Machine(id: 3,
                                        name: "Essenza Mini & Aeroccino3",
                                        description: "Design e personalidade para o seu cantinho Nespresso. Nossa menor cafeteira, feita para seus melhores Espressos e Lungos. Combine com o Aeroccino3 para preparar receitas com leite.",
                                        unitValue: 849,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12197794250782/Essenza-e-Aero-preto-fosco.png"
                                       ),
                                Machine(id: 4,
                                        name: "Pixie",
                                        description: "Seu design industrial dá um toque de Barista ao ritual do café. Faça Espressos ou Lungos em casa com apenas um botão.",
                                        unitValue: 699,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12772119117854/Pixie-Red.png"
                                       ),
                                Machine(id: 5,
                                        name: "CitiZ",
                                        description: "União de alta tecnologia e design retro-moderno, a dimensão compacta da CitiZ se encaixa perfeitamente em todos os ambientes.",
                                        unitValue: 799,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12824286068766/Citiz-Cherry-2000x2000-Frontal.png"
                                       ),
                                Machine(id: 6,
                                        name: "CitiZ & Aeroccino3",
                                        description: "União de alta tecnologia e design retro-moderno, a dimensão compacta da CitiZ se encaixa perfeitamente em todos os ambientes.",
                                        unitValue: 1099,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12896355057694/citiz-white-2000x2000.png"
                                       ),
                                Machine(id: 7,
                                        name: "Essenza Plus",
                                        description: "Café com muito mais opções para agradar a você e à família inteira. Conheça a máquina que pede seu Nespresso favorito através do botão de compra automática.",
                                        unitValue: 899,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12911623307294/DRange-Red.png"
                                       ),
                                Machine(id: 8,
                                        name: "Lattissima One",
                                        description: "A máquina mais prática para quem gosta de café com leite. Cappuccino ou Latte Macchiato? É só adicionar leite e ela prepara a receita na medida certa.",
                                        unitValue: 1099,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12197800116254/Lattissima-Branco.png"
                                       ),
                                Machine(id: 9,
                                        name: "Expert",
                                        description: "Personalize cada xícara de café na sua casa com uma variedade especial de tamanhos e temperaturas. A tecnologia da Expert torna você um Especialista em café.",
                                        unitValue: 1299,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12197799133214/Expert.png"
                                       ),
                                Machine(id: 10,
                                        name: "Expert & Aeroccino3",
                                        description: "Personalize cada xícara de café na sua casa com uma variedade especial de tamanhos e temperaturas. A tecnologia da Expert torna você um Especialista em café. Combine com o Aeroccino3 para preparar receitas com leite.",
                                        unitValue: 1599,
                                        image: "https://www.nespresso.com/ecom/medias/sys_master/public/12197799428126/Expert-Combo.png"
                                       )
        ])
    }
    
}
