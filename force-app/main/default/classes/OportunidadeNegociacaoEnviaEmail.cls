public class OportunidadeNegociacaoEnviaEmail {
    private List<Opportunity> m_listDataNew;
    private List<Opportunity> m_listFiltered = new List<Opportunity>();
    private Map<Id, Opportunity> m_mapDataOld;
    private Map<Id, Opportunity> m_mapObjFiltered = new Map<Id, Opportunity>();
    private Boolean hasRecords;
    private final String FASE_NEGOCIACAO = 'Em Negociação';

    public OportunidadeNegociacaoEnviaEmail(List<Opportunity> lstDataNew, Map<Id,Opportunity> mapDataOld){
        this.m_listDataNew = lstDataNew;
        this.m_mapDataOld = mapDataOld;
        filter();
        this.hasRecords = !m_listFiltered.isEmpty();
    }

    private void filter(){
        for(Opportunity opp : m_listDataNew){
            if (opp.Pricebook2Id != m_mapDataOld.get(opp.Id).Pricebook2Id) {
                m_listFiltered.add(opp);
            }
        }      
    }

    public void run(){
        if(hasRecords){
            OpportunityBO.enviaEmailCatalogoPreco(m_listFiltered);
        }
    }
}