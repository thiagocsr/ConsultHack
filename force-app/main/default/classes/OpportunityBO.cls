public class OpportunityBO {

    public static Opportunity criaOportunidade(){
        Opportunity opp = new Opportunity(
            Name = 'Opp Teste',
            CloseDate = Date.today()+10,
            Amount = 10000,
            StageName = 'Identificado'
        );
        return opp;
    }
    
    public static void criaTarefaRelacionadaOpp(List<Opportunity> opps){
        List<Task> newTasks = new List<Task>();
        for(Opportunity opp : opps){
            Task task = new Task(Subject = 'Um time de profissionais deve ser designado para o local do reparo.', Priority = 'High', WhatId = opp.Id, ActivityDate = date.today()+5);
            newTasks.add(task);
        }
        insert newTasks;
    }

    public static void enviaEmailCatalogoPreco(List<Opportunity> opps){
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            for (Opportunity opp : opps) {
                if (opp.Email__c != null && opp.Email__c != '') {
                        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                        email.setToAddresses(new String[] {opp.Email__c});
                        email.setSubject('Novos Preços');
                        email.setPlainTextBody('Olá, caro cliente ' + ',\n\nO catálogo de preços da oportunidade ' + opp.Name + ' foi atualizado. Por favor, verifique os novos preços disponíveis.\n\nObrigado,\nHack Consultoria.');
                        emails.add(email);
                }          
            }
            Messaging.sendEmail(emails);
    }
}