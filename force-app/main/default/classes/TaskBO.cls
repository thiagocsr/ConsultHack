public class TaskBO {
    public static Task retornaTaskRelacionada(Id id) {
        return [SELECT Id, Subject, ActivityDate, WhatId
                FROM Task
                WHERE WhatId = :id
        ];
    }

    public static Task retornaTaskRelacionadaWho(Id id) {
        return [Select id, Subject, whoId from Task where whoId = :id];
    }
}