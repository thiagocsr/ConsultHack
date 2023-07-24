@isTest
private class stageOpportunityTest {
    
    @isTest static void testGetOppLwc() {
        // Criando uma lista de 5 oportunidades com um loop que usa o método add para adicionar cada opp à uma lista
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer i = 1; i <= 5; i++){
            opps.add(new Opportunity(Name='Teste Opp ' + i, Email__c = 'hack@gmail.com', Amount=i*1000, StageName='Identificado', CloseDate=Date.today()));
        }        
        insert opps;
        
        // Criando uma variável para armazenar o resultado do método getOppLwc da classe "stageOpportunity" pra retornar as opps adicionadas recentemente
        List<Opportunity> oppsResult = stageOpportunity.getOppLwc();
        
        // Teste positivo verificando se o método retorna a lista correta de oportunidades
        System.assertEquals(5, oppsResult.size(), 'O número de oportunidades retornadas deve ser 5.');
    }
}