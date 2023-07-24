@isTest
public class TestOppOver10kCreateTask {
    @isTest
    public static void criaTask(){
        Opportunity opp = OpportunityBO.criaOportunidade();
        insert opp;
        opp.StageName = 'Contrato Assinado';
        update opp;
        Task task = new Task();
        
        try{
            task = TaskBO.retornaTaskRelacionada(opp.Id);
        }catch (Exception e){
            System.assert(false);
        }
        System.assert(task.WhatId == opp.Id);

    }

    @isTest
    public static void naoCriaTask(){
        Opportunity opp = OpportunityBO.criaOportunidade();
        insert opp;
        opp.StageName = 'Perda';
        opp.Motivo__c = 'F total';
        update opp;
        Task task = new Task();
        
        try{
            task = TaskBO.retornaTaskRelacionada(opp.Id);
        }catch (Exception e){
            System.assert(false);
        }
        System.assert(task.WhatId == opp.Id, 'Não criou tarefa!');

    }
}