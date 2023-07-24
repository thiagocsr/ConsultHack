import { LightningElement } from 'lwc';
/*import styleCarousel from '.c/carouselDemo'; // Importa o estilo CSS para o componente*/
import funilImg from '@salesforce/resourceUrl/funil';
import clienteImg from '@salesforce/resourceUrl/cliente';
import leadImg from '@salesforce/resourceUrl/lead';

export default class CarouselDemo extends LightningElement {
    // Declara a classe CarouselDemo como uma extensão de LightningElement

        carousel = [
        // Declaração de uma variável chamada "carousel" que contém um array de objetos
        {
            id: "1",
            header: "Converta seu Lead em um Contato ou Oportunidade",
            src: leadImg,
            href: "https://help.salesforce.com/s/articleView?id=000388015&type=1",
            description: "Saiba mais no site Salesforce"
            /*https://img.freepik.com/vetores-gratis/ilustracao-de-design-plano-b2b_23-2149337639.jpg?size=626&ext=jpg&uid=R93830986&ga=GA1.2.460056409.1681601205&semt=robertav1_2_sidr*/
        },
        {
            id: "2",
            header: "Como atrair clientes",
            src: clienteImg,
            href: "https://www.salesforce.com/br/resources/articles/prospeccao-de-clientes/",
            description: "Saiba mais no site Salesforce"
            /*https://img.freepik.com/vetores-gratis/conceito-abstrato-de-marketing-de-engajamento_335657-3096.jpg?size=626&ext=jpg&uid=R93830986&ga=GA1.1.460056409.1681601205&semt=robertav1_2_sidr*/
        },
        {
            id: "3",
            header: "O que é funil de vendas?",
            src: funilImg,
            href: "https://www.salesforce.com/br/crm/funil-de-vendas/",
            description: "Saiba mais no site Salesforce"
        }
    ];
    handleImageClick(event) { 
    //Declaração de uma função chamada handleImageClick que recebe o evento click como argumento.
    //Essa função handleImageClick é acionada quando uma imagem no carrossel é clicada. Ela extrai o URL associado à imagem e abre esse URL em uma nova guia do navegador.
        const link = event.currentTarget.dataset.href;
        //Extrai o valor do atributo data-href do elemento clicado e o armazena na variável link. O atributo data-href é definido no componente lightning-carousel-image como data-href={photo.href}.
        window.open(link, '_blank');
        //Abre uma nova janela ou guia do navegador, usando o valor armazenado em link como o URL de destino. O segundo argumento '_blank' indica que a nova janela deve ser aberta em uma nova guia.
    }
}