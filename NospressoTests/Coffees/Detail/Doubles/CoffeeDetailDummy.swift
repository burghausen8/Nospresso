@testable import Nospresso
import Foundation

extension CoffeeDetailResponse {
    
    static func dummy() -> CoffeeDetailResponse {
        
        return .init(coffees:
                        [CoffeeDetail(
                            id: 1,
                            name: "Hawaii Kona",
                            description: "CAFÉ FRUTADO, EQUILIBRADO E RARO",
                            intensity: 5,
                            unitValue: 6,
                            image: "https://www.nespresso.com/ecom/medias/sys_master/public/13334877011998/Desktop-Standard-80x80.png",
                            measurements: ["espresso"],
                            origin: "Hoje, o café Hawaii Kona é produzido por mais de 600 fazendas, a maioria delas familiares e cada uma ocupando quase dois hectares de terra. Estas condições especiais significam que todos agricultores conhecem os seus cafeeiros \"como a palma da sua mão\".",
                            roasting: "Esse café passou por um processo de torra média que ajudou a chegar na intensidade ideal para que suas notas mais frutadas fossem valorizadas na xícara.",
                            perfil: "Hawaii Kona apresenta notas frutadas e uma textura mais sedosa, ganhando um toque de nozes que ajuda a compor um café de perfil mais equilibrado, agradando todos os paladares."
                        ),
                         CoffeeDetail(
                            id: 2,
                            name: "Aged Sumatra",
                            description: "CAFÉ ARTESANAL, APRIMORADO PELO TEMPO",
                            intensity: 7,
                            unitValue: 4,
                            image: "https://www.nespresso.com/ecom/medias/sys_master/public/13415712784414/C-0625-Responsive-Standard-80x80.png",
                            measurements: [
                                "espresso",
                                "lungo"
                            ],
                            origin: "No alto da montanha Gayo, na província de Aceh, na ilha de Sumatra, os agricultores praticam o método giling basah para processar os grãos de café. Durante 3 anos, os grãos são estocados em sacos de juta respiráveis, perdendo e ganhando umidade seguindo o ritmo da natureza.",
                            roasting: "Esse café é separado em dois lotes para garantir um perfil tão rico. A primeira metade dos grãos passa por uma torra mais intensa e curta, o que ajuda a acentuar as características criadas no processo de envelhecimento: as notas amadeiradas. Já a segunda metade, é torrada por mais tempo.",
                            perfil: "A combinação do método gilling basah com o envelhecimento de três anos, desenvolve um perfil único e distinto – um café amadeirado com notas de especiarias e finalização de cacau e caramelo."
                         ),
                         CoffeeDetail(
                            id: 3,
                            name: "India",
                            description: "CAFÉ COM ROBUSTA DE MONÇÕES",
                            intensity: 11,
                            unitValue: 2.8,
                            image: "https://www.nespresso.com/ecom/medias/sys_master/public/10840367792158/C-0359-India-80x80.png",
                            measurements: [
                                "espresso",
                                "lungo"
                            ],
                            origin: "Mix de grãos Arábica e Robusta Indianos",
                            roasting: "Por meio da torra separada de grãos conseguimos manter as distintas características de grãos Arábica e Robusta.",
                            perfil: "Os grãos de café Robusta Monsoon passam meses expostos aos ventos das Monções. Esse blend é um café complexo, encorpado e aromático, com notas amadeiradas e de especiarias."
                         ),
                         CoffeeDetail(
                            id: 4,
                            name: "Indonesia",
                            description: "CAFÉ COM ARÁBICA NO MÉTODO DE DESCASCAMENTO ÚMIDO",
                            intensity: 8,
                            unitValue: 2.8,
                            image: "https://www.nespresso.com/ecom/medias/sys_master/public/10820727865374/C-0360-Indonesia-80x80.png",
                            measurements: [
                                "espresso",
                                "lungo"
                            ],
                            origin: "100% Arábica Indonésio",
                            roasting: "Torra média, os grãos de cafés da Sumatra, torrados separadamente, trazem uma boa complexidade aromática na xícara",
                            perfil:  "Métodos especiais de descascamento úmido dos frutos são usados no processamento desse café Arábica, resultando numa textura rica, notas aromáticas de tabaco curado, folhas e madeira verde"
                         ),
                         CoffeeDetail(
                            id: 5,
                            name: "Colombia",
                            description:  "CAFÉ COM ARÁBICA DE COLHEITA TARDIA",
                            intensity: 6,
                            unitValue: 3.8,
                            image: "https://www.nespresso.com/ecom/medias/sys_master/public/10842190675998.png",
                            measurements: [
                                "espresso",
                                "lungo"
                            ],
                            origin: "100% Arábica Colombiano",
                            roasting: "Torra mais leve e rápida preserva notas equilibradas e delicadas desses grãos colombianos",
                            perfil: "Os grãos Arábicas deste café são colhidos tardiamente num processo cuidadoso que traz características marcantes de frutas vermelhas, com destaque para groselha e framboesa"
                         ),
                         CoffeeDetail(
                            id: 6,
                            name: "Nicaragua",
                            description: "CAFÉ COM ARÁBICA \"BLACK-HONEY\"",
                            intensity: 5,
                            unitValue: 2.8,
                            image: "https://www.nespresso.com/ecom/medias/sys_master/public/10838071672862/C-0362-nicaragua-80x80.png",
                            measurements: [
                                "espresso",
                                "lungo"
                            ],
                            origin: "100% Arábica Nicaraguense",
                            roasting: "Por meio da torra separada de grãos conseguimos manter o equilíbrio ideal aos grãos da Nicarágua",
                            perfil: "Os grãos de café Arábica obtidos pelo processo meticuloso “Black- honey” trazem um corpo envolvente, textura acetinada com notas cereais doces"
                         ),
                         CoffeeDetail(
                            id: 7,
                            name: "Ethiopia",
                            description: "CAFÉ COM ARÁBICA DE SECAGEM NATURAL",
                            intensity: 4,
                            unitValue: 2.8,
                            image:  "https://www.nespresso.com/ecom/medias/sys_master/public/10831332802590/C-0363-Ethiopia-80x80.png",
                            measurements: [
                                "espresso",
                                "lungo"
                            ],
                            origin: "100% Arábica Etíope",
                            roasting: "Torra mais leve e rápida preserva notas vivas e delicadas desses grãos etíopes",
                            perfil: "O método de processamento natural dos grãos traz um sabor único e um café bastante aromático, floral e vibrante. Esse Arábica apresenta delicadas notas de frutas e flor de Laranjeira"
                         )
                        ]
        )
    }
}
