public class OpportunityTriggerHandler extends TriggerHandler{
    //Aqui estou apenas criando variáveis que vão receber a listas que vou trabalhar, 
    //então no lugar de usar trigger.new num for, eu chamo a variável newList, que recebeu o valor do trigger.new.
    private List<Opportunity> newList;
    private List<Opportunity> oldList;
    private Map<Id,Opportunity> newMap;
    private Map<Id,Opportunity> oldMap;
    
    public OpportunityTriggerHandler(){
        this.newList = (List<Opportunity>) Trigger.new;
        this.oldList = (List<Opportunity>) Trigger.old;
        this.newMap = (Map<Id,Opportunity>) Trigger.newMap;
        this.oldMap = (Map<Id,Opportunity>) Trigger.oldMap;
        
    }
    
    //Aqui é o controle de tempo da trigger, basta chamar o construtor da sua
    //classe com as condições da trigger aqui
    protected override void beforeInsert(){      
    }
    
    protected override void afterInsert(){
    }
    
    protected override void beforeUpdate(){
       new OportunidadeNegociacaoEnviaEmail(newList, oldMap).run();
       new handleLossReason(newList);
    }
    
    protected override void afterUpdate(){
        new OportunidadeGanhaAcima10k(newList).run();
        new OppPerdidaHandler(newList, oldMap).run();
    }
}