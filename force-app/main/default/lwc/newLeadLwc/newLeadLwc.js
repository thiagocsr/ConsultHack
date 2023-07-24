import { LightningElement, api } from 'lwc';
import leadObject from '@salesforce/schema/Lead' //Importa o objeto Lead do Salesforce.
import Name from '@salesforce/schema/Lead.Name'; //Importa o campo Name do objeto Lead.
import CPF__c from '@salesforce/schema/Lead.CPF__c';
import Email from '@salesforce/schema/Lead.Email';
import MobilePhone from '@salesforce/schema/Lead.MobilePhone';
import City from '@salesforce/schema/Lead.City';
import State from '@salesforce/schema/Lead.State';
import Company from '@salesforce/schema/Lead.Company';
import Tipo_de_Projeto__c from '@salesforce/schema/Lead.Tipo_de_Projeto__c';
//import RecordTypeId from '@salesforce/schema/Lead.RecordTypeId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//Importa a classe ShowToastEvent do módulo lightning/platformShowToastEvent para exibir mensagens de toast.

export default class NewLeadLwc extends LightningElement {

    leadObject = leadObject; //Declara uma propriedade leadObject e a inicializa com o valor do objeto leadObject importado anteriormente.
    NameField = Name; //Declara uma propriedade nameField e a inicializa com o valor do campo Nome importado anteriormente.
    CPF__cField = CPF__c;
    EmailField = Email;
    MobilePhoneField = MobilePhone;
    CityField = City;
    StateField = State;
    CompanyField = Company;
    Tipo_de_Projeto__cField = Tipo_de_Projeto__c;
    /*RecordTypeIdField = RecordTypeId;*/

    @api recordId
    //Anotação @api que torna a propriedade recordId acessível para outros componentes.

    handleLeadCreated(event) {
        //Declaração de um método chamado handleLeadCreated que é executado quando um novo Lead é criado.

        console.log(event.detail); //Exibe os detalhes do evento no console.
        this.dispatchEvent( //Dispara um evento personalizado do tipo ShowToastEvent para exibir uma mensagem de toast com título, mensagem e variante de sucesso.
            new ShowToastEvent({
                title: 'Parabéns!',
                message: 'Novo Lead foi criado com sucesso!',
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