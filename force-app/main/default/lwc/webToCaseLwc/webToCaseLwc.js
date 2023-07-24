import { LightningElement, api } from 'lwc';

import ContactId from '@salesforce/schema/Case.ContactId';
import AccountId from '@salesforce/schema/Case.AccountId';
import Type from '@salesforce/schema/Case.Type';
import Etapa__c from '@salesforce/schema/Case.Etapa__c';
import Origin from '@salesforce/schema/Case.Origin';
import Subject from '@salesforce/schema/Case.Subject';
import Description from '@salesforce/schema/Case.Description';
import Comments from '@salesforce/schema/Case.Comments';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//Importa a classe ShowToastEvent do módulo lightning/platformShowToastEvent para exibir mensagens de toast.

export default class webToCaseLwc extends LightningElement {

    ContactIdField = ContactId; 
    AccountIdField = AccountId; 
    TypeField = Type;
    Etapa__cField = Etapa__c;
    OriginField = Origin;
    SubjectField = Subject;
    DescriptionField = Description;
    CommentsField = Comments;

    
    /*RecordTypeIdField = RecordTypeId;*/

    @api recordId
    //Anotação @api que torna a propriedade recordId acessível para outros componentes.

    handleCaseCreated(event) {
        //Declaração de um método chamado handleLeadCreated que é executado quando um novo Caso é criado.

        console.log(event.detail); //Exibe os detalhes do evento no console.
        this.dispatchEvent( //Dispara um evento personalizado do tipo ShowToastEvent para exibir uma mensagem de toast com título, mensagem e variante de sucesso.
            new ShowToastEvent({
                title: 'Parabéns!',
                message: 'Novo Caso foi criado com sucesso!',
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