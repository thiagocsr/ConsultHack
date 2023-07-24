public class OportunidadeGanhaAcima10k {

    private List<Opportunity> m_listDataNew;
    private List<Opportunity> m_listFiltered = new List<Opportunity>();
    private Boolean hasRecords;
    final Double MAX_OPP_AMOUNT = 10000;
    final String WIN_OPP_STAGENAME = 'Contrato Assinado';

    public OportunidadeGanhaAcima10k(List<Opportunity> lstDataNew){
        this.m_listDataNew = lstDataNew;
        filter();
        this.hasRecords = !m_listFiltered.isEmpty();
        
    }
    
    private void filter(){
        for(Opportunity opp : m_listDataNew){
            if(opp.Amount > MAX_OPP_AMOUNT && opp.StageName == WIN_OPP_STAGENAME){
                m_listFiltered.add(opp);
            } 
            
        }
        
    }
    
    public void run(){
        if(hasRecords){
            OpportunityBO.criaTarefaRelacionadaOpp(m_listFiltered);
        }

    }  

}