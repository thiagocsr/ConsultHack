@isTest
public class handleLossReasonTEST {
    
    @isTest static void testPositivoOpp(){
        Opportunity newOp = new Opportunity(
            CloseDate = System.today(),
            Name = 'Teste de op',
            StageName = 'Proposta Aceita',
            Email__c = 'hack@gmail.com',
            Amount = 500000
        );
        insert newOp;
        
        newOp.StageName = 'Perda';
        update newOp;
        
        Opportunity insertedOp = [SELECT Id, StageName, Motivo__c FROM
                                  Opportunity WHERE Id =:newOp.Id];
        
        //TESTE POSITIVO
        System.assert(insertedOp.Motivo__c == null, 'Preencha o campo de motivo');        
    }
}