@isTest
public class OppPerdidaTest {
    @isTest static void testPositivoOpp(){
            Opportunity newOp = new Opportunity(
            CloseDate = System.today(),
            Name = 'Teste de op',
            StageName = 'Perda',
            Email__c = 'hack@gmail.com',
            Amount = 50000
        );
        insert newOp;
        
        newOp.StageName = 'Contrato Assinado';
        update newOp;
        
        Opportunity insertedOp = [SELECT Id, StageName FROM Opportunity WHERE Id =:newOp.Id];
        
        //teste positivo
        System.assertEquals('Perda', insertedOp.StageName, 'Status perdido não pode ser alterado.');        
        
     	//teste negativo
     	
    }
}