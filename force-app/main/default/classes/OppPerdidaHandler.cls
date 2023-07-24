public class OppPerdidaHandler {
    private List<Opportunity> m_listDataNew;
    private List<Opportunity> m_listFiltered = new List<Opportunity>();
    private Map<Id, Opportunity> m_mapDataOld;
    private Map<Id, Opportunity> m_mapObjFiltered = new Map<Id, Opportunity>();
    private Boolean hasRecords;
    private final String FASE_PERDA = 'Perda';
    private final String FASE_GANHA = 'Contrato Assinado';

    public OppPerdidaHandler(List<Opportunity> lstDataNew, Map<Id,Opportunity> mapDataOld){
        this.m_listDataNew = lstDataNew;
        this.m_mapDataOld = mapDataOld;
        filter();
        this.hasRecords = !m_listFiltered.isEmpty();
    }

    private void filter(){
        for(Opportunity opp : m_listDataNew){
            if((m_mapDataOld.get(opp.Id).StageName == FASE_PERDA && opp.StageName != FASE_PERDA) || (m_mapDataOld.get(opp.Id).StageName == FASE_GANHA && opp.StageName != FASE_GANHA)){
                m_listFiltered.add(opp);
            }      
        }      
    }

    public void run(){
        if(hasRecords){
            for(Opportunity opp : m_listFiltered){
                opp.addError('Esse status não pode ser alterado');
            }
        }
    }
}