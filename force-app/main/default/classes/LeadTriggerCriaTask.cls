public class LeadTriggerCriaTask {

    private List<Lead> m_listDataNew;
    private List<Lead> m_listFiltered = new List<Lead>();
    private Map<Id, Lead> m_mapDataOld;
    private Map<Id, Lead> m_mapObjFiltered = new Map<Id, Lead>();
    private Boolean hasRecords;
    private final String STATUS_ANTIGO = 'Contactado';
    private final String STATUS_NOVO = 'Em negociação';

    public LeadTriggerCriaTask(List<Lead> lstDataNew, Map<Id,Lead> mapDataOld){
        this.m_listDataNew = lstDataNew;
        this.m_mapDataOld = mapDataOld;
        filter();
        this.hasRecords = !m_listFiltered.isEmpty();
    }

    private void filter(){
        for(Lead lead : m_listDataNew){
            if(m_mapDataOld.get(lead.Id).Status == STATUS_ANTIGO && lead.Status == STATUS_NOVO){
                m_listFiltered.add(lead);
            }      
        }      
    }

    public void run(){
        if(hasRecords){
            LeadBO.criaTarefaRelacionada(m_listFiltered);            
        }
    }  
}