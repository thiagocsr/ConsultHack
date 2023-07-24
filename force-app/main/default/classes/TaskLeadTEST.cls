@isTest
public class TaskLeadTEST {
    @isTest static void verificaTarefaPositivo(){
        // Criando um Lead que atenda aos critérios da trigger
        boolean naoCriaTarefa = false;        
         
        Lead lead = LeadBO.criaLead();
        insert lead;
        System.debug(lead);
        lead.Status = 'Em negociação';
        update lead;
        
        Lead leadAtt = [SELECT Id, LastName FROM Lead WHERE Id = :lead.Id];
        System.debug(leadAtt);
        try{
            Task task = TaskBO.retornaTaskRelacionadaWho(lead.Id);
        }catch (Exception e){
            naoCriaTarefa = true;
            System.debug('Erro é: ' +  e);
        }

        System.Assert(!naoCriaTarefa, 'Não foi :(');
        
        //System.assert(lead.Id == task.WhoId, 'Falhou Aqui');
    }
    
    @isTest static void verificaTarefaNegativo(){
        // Criando um Lead que não atenda aos critérios da trigger
        Lead testLead2 = LeadBO.criaLead();
        insert testLead2;
        
        //atualizando o campo Status do Lead
        testLead2 = new Lead(
            id = testLead2.id,
            Status = 'Em negociação'
        );
        update testLead2;
        
        // TESTE NEGATIVO verificando se nenhuma Task foi criada para o Lead que não atende aos critérios
        List<Task> tasks = [SELECT WhoId FROM Task WHERE WhoId =:testLead2.Id];
        System.assertEquals(0, tasks.size(), 'Não deve ter sido criada uma tarefa para um Lead que não atende aos critérios');
    }
}