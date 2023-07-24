import { LightningElement, api } from 'lwc';
import opportunityObject from '@salesforce/schema/Opportunity' //Importa o objeto Opportunity do Salesforce.
import Nome from '@salesforce/schema/Opportunity.Name'; //Importa o campo Name do objeto Opportunity.
import Amount from '@salesforce/schema/Opportunity.Amount';
import CloseDate from '@salesforce/schema/Opportunity.CloseDate';
import StageName from '@salesforce/schema/Opportunity.StageName';
import Email__c from '@salesforce/schema/Opportunity.Email__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//Importa a classe ShowToastEvent do módulo lightning/platformShowToastEvent para exibir mensagens de toast.

export default class NewOpportunity extends LightningElement {

    opportunityObject = opportunityObject; //Declara uma propriedade opportunityObject e a inicializa com o valor do objeto opportunityObject importado anteriormente.
    nameField = Nome; //Declara uma propriedade nameField e a inicializa com o valor do campo Nome importado anteriormente.
    AmountField = Amount;
    CloseDateField = CloseDate;
    StageNameField = StageName;
    EmailField = Email__c;

    @api recordId
    //Anotação @api que torna a propriedade recordId acessível para outros componentes.

    handleOpportunityCreated(event) {
        //Declaração de um método chamado handleOpportunityCreated que é executado quando uma nova oportunidade é criada.

        console.log(event.detail); //Exibe os detalhes do evento no console.
        this.dispatchEvent( //Dispara um evento personalizado do tipo ShowToastEvent para exibir uma mensagem de toast com título, mensagem e variante de sucesso.
            new ShowToastEvent({
                title: 'Parabéns!',
                message: 'Nova oportunidade foi criada com sucesso!',
                variant: 'success',
            }))

        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        ); //Obtém todos os campos de entrada dentro do componente usando querySelectorAll.
        if (inputFields) { //Verifica se foram encontrados campos de entrada.
            inputFields.forEach(field => {
                field.reset(); //Reseta o valor de cada campo de entrada para o seu estado original.
            });
        }

    }

    handleError(event) { //Declaração de um método chamado handleError que é executado quando ocorre um erro.
        console.log(event.detail);
        this.dispatchEvent( //Dispara um evento personalizado do tipo ShowToastEvent para exibir uma mensagem de toast de erro com título, mensagem e variante de erro.
            new ShowToastEvent({
                title: 'Preencha os dados corretamente',
                message: event.detail.message,
                variant: 'error',
            }),
        );
    }

    handleReset() { //Declaração de um método chamado handleReset que é executado quando o botão de reset é clicado.
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );

        if (inputFields) {
            inputFields.forEach(field => {
                field.reset(); //Reseta o valor de cada campo de entrada para o seu estado original.
            });
        }
    }
}