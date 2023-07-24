public class LeadBO {

    public static Lead criaLead(){
        Lead lead = new Lead(
            FirstName = 'Johnn',
            LastName = 'Doe',
            Company = 'Acme Corporation',
            Phone = '2356138316',
            Status = 'Contactado',
            State = 'SP'
        );
        return lead;
    }

    public static List<Lead> desqualificaLeadPorEstado(List<Lead> leads){
        for(Lead lead : leads){
            lead.Status = 'Perdido';           
        }
        return leads;
    }

    public static void criaTarefaRelacionada(List<Lead> leads){
        List<Task> tasks = new List<Task>();
        for(Lead lead : leads){
            Task task = new Task(Subject = 'Tentar a conversão nos próximos 10 dias.',WhoId = lead.Id, ActivityDate = date.today()+10);
            tasks.add(task);
        }
        insert tasks;
    }

    public static Lead criaLeadPessoaFisica(){
        Id stExam = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Pessoa Física').getRecordTypeId();
        return new Lead(
            LastName = 'Teste class',
            Company = 'Teste',
            Status = 'Contactado',
            RecordTypeId = stExam
        );
    }
}