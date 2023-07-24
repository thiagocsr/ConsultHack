@isTest
public class LeadTestValidaRegiao {
    @isTest
    public static void criaLeadRegiaoAceita(){
        Lead lead = LeadBO.criaLeadPessoaFisica();
        insert lead;
        lead.State = 'SP';

        try{
            update lead;
        }catch (Exception e){
            System.assert(false, 'Falhou!');
        }

        Lead lead2 = [SELECT Id, Status FROM Lead WHERE Id = :lead.id];

        System.assert(lead2.Status != 'Perdido', 'Fail!');
    }

    @isTest
    public static void criaLeadOutraRegiao(){
        Lead lead = LeadBO.criaLeadPessoaFisica();
        insert lead;
        lead.State = 'PE';

        try{
            update lead;
        }catch (Exception e){
            System.assert(false, 'Falhou!');
        }

        Lead lead2 = [SELECT Id, Status FROM Lead WHERE Id = :lead.id];

        System.assert(lead2.Status == 'Perdido', 'Fail!');
    }
}