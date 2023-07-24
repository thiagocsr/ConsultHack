public class handleLossReason {
    public handleLossReason(List<Opportunity> opps) {
        for(Opportunity opp : opps) {
            if(opp.StageName == 'Perda' && opp.Motivo__c == null) {
                opp.addError('Preencha o motivo da fase perdida.');
            }
        }
    }
}