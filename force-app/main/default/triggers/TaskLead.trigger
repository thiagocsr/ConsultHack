trigger TaskLead on Lead (before update) { 
    /*if(Trigger.isUpdate && Trigger.isBefore){ 
        for(Lead newLead : Trigger.New){ 
            if(Trigger.oldMap.get(newLead.Id).Status == 'Contactado' && newLead.Status == 'Em negociação'){                
                Task newTask = new Task();
                newTask.Subject = 'Tentar a conversão nos próximos 10 dias';
                newTask.WhoId = newLead.Id;
                newTask.ActivityDate = Date.today().addDays(10);
                insert newTask;
            }
        }
    }*/
}