public class LeadTriggerValidaRegiao {

    private List<Lead> m_listDataNew;
    private List<Lead> m_listFiltered = new List<Lead>();
    private Boolean hasRecords;

    public LeadTriggerValidaRegiao(List<Lead> lstDataNew){
        this.m_listDataNew = lstDataNew;
        filter();
        this.hasRecords = !m_listFiltered.isEmpty();   
    }

    private void filter(){
        for(Lead lead : m_listDataNew){
            String segura;
            try{
                segura = lead.State.toUpperCase();
            }catch(Exception e){
                System.debug(e);
            }
            
            if(segura != 'ES' && segura != 'MG' && segura != 'RJ' && segura != 'SP'){
                m_listFiltered.add(lead);
            }      
        }      
    }

    public void run(){
        if(hasRecords){
            LeadBO.desqualificaLeadPorEstado(m_listFiltered);
        }
    }  
}