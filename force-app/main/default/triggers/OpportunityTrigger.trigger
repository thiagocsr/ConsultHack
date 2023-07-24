trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    //Seguindo as boas praticas de desenvolvimento, devemos ter apeans 1 trigger por objeto, para fins de evitar conflito entre trigger e tornar o processo de alterações mais fáceis
    //Neste caso, a classe 'OpportunityTriggerHandler' controla os tempos e quais métodos são chamados em cada tempo
    new OpportunityTriggerHandler().run();
   
}