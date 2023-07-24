import { LightningElement, wire } from 'lwc';
//Importa as classes LightningElement e wire do módulo lwc.
import getOppLwc from '@salesforce/apex/lwcOpportunity.getOppLwc';
//Importa a função getOppLwc do módulo lwcOpportunity usando a anotação @salesforce/apex.


export default class ClosedOpportunity extends LightningElement {
//Define uma classe chamada ClosedOpportunity que estende a classe LightningElement.

    @wire(getOppLwc)
    //Usa a anotação @wire para estabelecer uma conexão de fio (wire) entre a propriedade Opportunity e o resultado da função getOppLwc.
    Opportunity
    //é a propriedade que será preenchida com os dados retornados pela função getOppLwc.
}