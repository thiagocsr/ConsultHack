public class LeadTriggerHandler extends TriggerHandler{
    private List<Lead> newList;
    private List<Lead> oldList;
    private Map<Id,Lead> newMap;
    private Map<Id,Lead> oldMap;

    
    public LeadTriggerHandler(){
        this.newList = (List<Lead>) Trigger.new;
        this.oldList = (List<Lead>) Trigger.old;
        this.newMap = (Map<Id,Lead>) Trigger.newMap;
        this.oldMap = (Map<Id,Lead>) Trigger.oldMap;
    }

    protected override void beforeInsert(){  
        new LeadTriggerValidaRegiao(newList).run();
    }
    
    protected override void afterInsert(){
    }
    
    protected override void beforeUpdate(){   
        //new LeadTriggerCriaTask(newList, oldMap).run();
        new LeadTriggerValidaRegiao(newList).run();
    }
    
    protected override void afterUpdate(){
        new LeadTriggerCriaTask(newList, oldMap).run();
    }
}