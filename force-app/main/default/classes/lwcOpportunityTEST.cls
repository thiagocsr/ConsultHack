@isTest
private class lwcOpportunityTEST {
    
    @isTest static void testGetOppLwc() {
        // Criando oportunidades com diferentes StageName
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer i = 1; i <= 3; i++){
            opps.add(new Opportunity(Name='Teste Opp ' + i, Email__c = 'hack@gmail.com', Amount=i*1000, StageName='Contrato Assinado', CloseDate=Date.today()));
        }        
        insert opps;
        
        List<Opportunity> opps1 = new List<Opportunity>();
        for(Integer i = 1; i <= 2; i++){
            opps1.add(new Opportunity(Name='Teste Opp ' + i, Email__c = 'hack@gmail.com', Amount=i*1000, StageName='Perda', CloseDate=Date.today()));
        }        
        insert opps1;
        
        // Criando uma variável para armazenar o resultado do método getOppLwc da classe "lwcOpportunity" pra retornar as opps adicionadas recentemente
        List<Opportunity> oppList = lwcOpportunity.getOppLwc();
        
        // Verificar se a lista contém apenas oportunidades com StageName igual a "Contrato Assinado" ou "Perda"
        for(Opportunity opp : oppList) {
            System.assertEquals('Contrato Assinado', opp.StageName, 'A oportunidade não tem o StageName correto.');
            System.assertEquals('Perda', opp.StageName, 'A oportunidade não tem o StageName correto.');
        }
        
        // Verificando se o método retorna a lista correta de oportunidades
        System.assertEquals(5, oppList.size(), 'O número de oportunidades retornadas deve ser 5.');
    }
}