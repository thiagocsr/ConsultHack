@isTest
public class OportunidadeNegociacaoEnviaEmailTest {

    @isTest
    public static void testaEmailCatalogoPreco(){
        Pricebook2 tst = new Pricebook2();
            
        try{
        	tst = [select id, name from Pricebook2 where Name like 'Serviços Combinados'];
        }catch (Exception e){
            System.debug('Falha na query!');
        }

        Opportunity opp = OpportunityBO.criaOportunidade();
        opp.StageName = 'Em Negociação';
        opp.Pricebook2Id = '01sDo000001n7rzIAA';
        opp.Email__c = 'teste@gmail.com';
        insert opp;

        opp.Pricebook2Id = '01sDo000001nlvMIAQ';        
        update(opp);
        System.debug(opp);

        Opportunity opp2 = [SELECT Id, Name, Pricebook2Id FROM Opportunity WHERE Id = :opp.Id];
        System.assert(opp.Pricebook2Id == opp2.Pricebook2Id, 'Fail, :(');
    }
}